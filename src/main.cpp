/*
Horlogemeter

Counts 31.768Hz reference clock on pin PD5/T1
While a mechanical watch amplifier generates tick interrupts to pin PD1
Every interrupt tick, an array of 4/6/10 tick is updated, to calculate the signal validity, and the T1 counter is reset to 0

the running sensor4/6/10 arrays note 10 values of the sensor
Given a tick4 watch, it takes two (2) seconds for the array to display 100% sensor value, which seems ok at this point

*/
// ------- Preamble -------- //
#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include <avr/power.h>
#include <Arduino.h>
#include <LiquidCrystal_I2C.h>

#define TICKSAMPLES 10
#define SENSORSAMPLES 10
#define AVGSETTLE 10
#define AVGLENGTHSTART 60.0
#define AVGLENGTHMEDIUM 512.0

struct tickavg {
  double tick5;
  double tick6;
  double tick10;
};

struct ticksums {
  uint32_t tick5count;
  uint32_t tick6count;
  uint32_t tick10count;
};

volatile uint8_t tickpointer; // points to item in arrray of tick values
volatile ticksums sum;        // contains sums for all ticks
volatile uint8_t sensor5[TICKSAMPLES];
volatile uint8_t sensor6[TICKSAMPLES];
volatile uint8_t sensor10[TICKSAMPLES];
volatile uint16_t ptt; // previously read tick time;
uint8_t quality;
uint8_t temp5, temp6, temp10, i;
uint8_t ticks = 0;
uint8_t counter = 0;
uint16_t maxsignalloss = 0, signalacquired = 0;
tickavg avg;
double secperday;
double averageticktime;
double avglength;   // length of the EWMA running average (16/64/128 etc)
LiquidCrystal_I2C lcd(0x3f,20,4);
char displaytext[21]; 

void clearSensorArrays(void) {
    uint8_t i;
    // reset tickpointer to first item in array
    tickpointer = 0;
    // zero-out sensor arrays
    for(i = 0; i < TICKSAMPLES; i++)
    {
        sensor5[i] = 0;
        sensor6[i] = 0;
        sensor10[i] = 0;
    }
    // reset sensor values

    sum.tick5count = 0;
    sum.tick6count = 0;
    sum.tick10count = 0;

    avglength = AVGLENGTHSTART;
    avg.tick5 = avglength*32768.0/5;
    avg.tick6 = avglength*32768.0/6;
    avg.tick10 = avglength*32768.0/10;
}

void initCounter1(void)
{
    TCCR1A = 0; // normal mode, counter
    // Set external clock source on T1 pin, clock on rising edge:
    TCCR1B |= ((1 << CS10) | (1 << CS11) | (1 << CS12));
    TCNT1 = 0; // reset counter immediately, perhaps not needed
}

void interrupt0() {         /* Run every time there is a change on button */
    ptt = TCNT1;                        // read tick timer
    TCNT1 = 0; // reset tick timer

    if((3244 < ptt) && (ptt < 3309))
    {
        // Tick 10 found with +/- 5% margin
        avg.tick10 = ptt + avg.tick10 - ((avg.tick10) / avglength);
        sensor10[tickpointer] = 10;
        sum.tick10count++;
    }
    else
    {
        sensor10[tickpointer] = 0;
        if((5188 < ptt) && (ptt < 5734))
        {
            // Tick 6 found with +/- 5% margin
            avg.tick6 = ptt + avg.tick6 - ((avg.tick6) / avglength);
            sensor6[tickpointer] = 10;
            sum.tick6count++;
        }
        else
        {
            sensor6[tickpointer] = 0;
            if((6225 < ptt) && (ptt < 6880))
            {
                // Tick 5 found with +/- 5% margin
                avg.tick5 = ptt + avg.tick5 - ((avg.tick5) / avglength);
                sensor5[tickpointer] = 10;
                sum.tick5count++;
            }
            else sensor5[tickpointer] = 0;
        }
    }
    tickpointer++;
    if(tickpointer > TICKSAMPLES-1) tickpointer = 0; // rollover
}

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  clearSensorArrays();
  initCounter1();
  lcd.init();
  lcd.backlight();
  lcd.clear();
//  initInterrupt0();
  
  Serial.println();
  Serial.println("== Sensor readings ==");
  lcd.printf("+------------------+");
  lcd.setCursor(0,1);
  lcd.printf("|   Horlogemeter   |");
  lcd.setCursor(0,2);
  lcd.printf("|   Versie 1.2     |");
  lcd.setCursor(0,3);
  lcd.printf("+------------------+");
  delay(1000);
  attachInterrupt(digitalPinToInterrupt(2), interrupt0, RISING);
}

void loop() {
  // put your main code here, to run repeatedly:

  delay(1000);

  // tally sensor values
  temp5 = 0;
  temp6 = 0;
  temp10 = 0;
  for(i = 0; i < TICKSAMPLES; i++)
  {
    temp5 += sensor5[i];
    temp6 += sensor6[i];
    temp10 += sensor10[i];
  }
  if(temp5 >= 50)
  {
    ticks = 5;
    quality = temp5;
    secperday = (avg.tick5/avglength*5*3600*24/32768)-86400;
    averageticktime = avg.tick5/avglength;
  }
  else
  {
    if(temp6 >= 50)
    {
        ticks = 6;
        quality = temp6;
        secperday = (avg.tick6/avglength*6*3600*24/32768)-86400;
        averageticktime = avg.tick6/avglength;
    }
    else
    {
        if(temp10 >= 50)
        {
            ticks = 10;
            quality = temp10;
            secperday = (avg.tick10/avglength*10*3600*24/32768)-86400;
            averageticktime = avg.tick10/avglength;
        }
        else 
        {
          ticks = 0;
          quality = 0;
        }
    }
  }
  if(ticks == 0)
  {
    lcd.clear(); 
    lcd.setCursor(4,1);
    lcd.printf("Geen signaal");
    Serial.printf("Run %3d - No watch signal detected\r\n",counter);
    maxsignalloss += 1; // signal lost in this period, set counter
    if(maxsignalloss > 5)
    {
      // reset all counters and re-acquire signal
      clearSensorArrays(); // reset all sensors for re-acquiry
      //Serial.printf("Run %3d - Resetting counters\r\n", counter);
      maxsignalloss = 0;
      signalacquired = 0;
      avglength = AVGLENGTHSTART;
    }
  }
  else
  {
    // we have a signal, test how many times we got it first
    signalacquired += 1;

    if(signalacquired > AVGSETTLE)
    {
      // valid signal and average, print out results
      lcd.clear();
      snprintf(displaytext,sizeof(displaytext),"Signaal %d%%",quality);
      lcd.print(displaytext);
      lcd.setCursor(0,1);
      snprintf(displaytext,sizeof(displaytext),"%d t/s - %3.2f ms/t",ticks, averageticktime*(1000.0/32768));
      lcd.print(displaytext);
      lcd.setCursor(0,2);
      lcd.printf("%+06.1f sec/dag",secperday);
      lcd.setCursor(0,3);
      if(secperday > 0) lcd.printf("             Te snel");
      else lcd.printf("         Te langzaam");
      Serial.printf("Run %3d - %1d ticks/s - Signal %3d%% - average %4.2f = %3.2f sec/day\r\n",counter,ticks,quality,averageticktime,secperday);
      maxsignalloss = 0; // signal present, so reset counter

      // check if the average needs an additional length after the start
      if((signalacquired > (uint16_t)AVGLENGTHSTART) && avglength == AVGLENGTHSTART)
      {
        // switch to higher length, average out more samples
        avglength = AVGLENGTHMEDIUM;
        avg.tick5 = (AVGLENGTHMEDIUM/AVGLENGTHSTART)*avg.tick5;
        avg.tick6 = (AVGLENGTHMEDIUM/AVGLENGTHSTART)*avg.tick6;
        avg.tick10 = (AVGLENGTHMEDIUM/AVGLENGTHSTART)*avg.tick10;
        signalacquired = (uint16_t)AVGSETTLE;
        Serial.print("Switching to higher average length\r\n");
      }
    }
    else
    {
      // too few signals, let's wait for the average to clear up a little
      lcd.clear();
      snprintf(displaytext,sizeof(displaytext),"Signaal %d%%",quality);
      lcd.print(displaytext);
      lcd.setCursor(0,1);
      snprintf(displaytext,sizeof(displaytext),"%d tikken/s",ticks);
      lcd.print(displaytext);
      lcd.setCursor(0,2);
      lcd.printf("Gemiddelde bepalen");
      lcd.setCursor(0,3);
      snprintf(displaytext,sizeof(displaytext),"%d van %d samples", signalacquired, AVGSETTLE);
      lcd.printf(displaytext);
      Serial.printf("Run %3d - Signal %3d%% acquired, %d ticks/s - settling averages\r\n", counter, quality, ticks);
    }
    
  }   //Serial.printf("%ld %d %d %ld %f %1.2f\r\n",sum.tick5count, ticks, ptt, average.tick5>>8, avg.tick5/1024.0, (avg.tick5/1024.0*5*3600*24/32768)-86400);
  
  counter++;
}