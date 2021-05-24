/*
Horlogemeter

Counts 32.768Hz reference clock on pin PD5/T1
While a mechanical watch amplifier generates tick interrupts to pin PD1
Every interrupt tick, an array of 5/6/10 tick is updated, to calculate the signal validity, and the T1 counter is reset to 0


*/
#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include <avr/power.h>
#include <Arduino.h>
#include <LiquidCrystal_I2C.h>

#define TICKSAMPLES 10
#define MAXSIGNALLOSS 5

#define TICK10LOW   3244
#define TICK10HIGH  3309
#define TICK6LOW    5188
#define TICK6HIGH   5734
#define TICK5LOW    6225
#define TICK5HIGH   6880

struct tick_struct {
  uint32_t pulsecount5;   // counts pulses at 32768/s rate
  uint32_t pulsecount6;
  uint32_t pulsecount10;
  uint32_t tickcount5;
  uint32_t tickcount6;
  uint32_t tickcount10;
  uint8_t sensor5[TICKSAMPLES];
  uint8_t sensor6[TICKSAMPLES];
  uint8_t sensor10[TICKSAMPLES];
};

// globals used during interrupt routine
volatile tick_struct ticks; 
volatile uint8_t tickpointer; // points to item in arrray of tick values
volatile uint16_t ptt; // previously read tick time;

// globals used during loop
uint32_t tickcount, pulsecount; // used for temp reading respective counters during loop() to avoid race conditions
uint8_t quality;
uint8_t temp5, temp6, temp10, i;
uint8_t current_ticks = 0;
uint16_t maxsignalloss = 0;

double secperday;
LiquidCrystal_I2C lcd(0x3f,20,4);
char displaytext[21]; 

void clearSensorArrays(void) {
    uint8_t i;
    // reset tickpointer to first item in array
    tickpointer = 0;
    // zero-out sensor arrays
    for(i = 0; i < TICKSAMPLES; i++)
    {
        ticks.sensor5[i] = 0;
        ticks.sensor6[i] = 0;
        ticks.sensor10[i] = 0;
    }
    // reset total pulse counts per tick
    ticks.pulsecount5 = 0;
    ticks.pulsecount6 = 0;
    ticks.pulsecount10 = 0;

    // reset number of counted ticks
    ticks.tickcount5 = 0;
    ticks.tickcount6 = 0;
    ticks.tickcount10 = 0;
}

void initCounter1(void)
{
    TCCR1A = 0; // normal mode, counter
    // Set external clock source on T1 pin, clock on rising edge:
    TCCR1B |= ((1 << CS10) | (1 << CS11) | (1 << CS12));
    TCNT1 = 0; // reset counter immediately, perhaps not needed
}

void interrupt0() {        
    // fires each time a watch tick is detected
    // need to figure out if this was a valid tick time (after the previous)
    // and which ticksignal this is (5/6/10 ticks per second)
    // first tick will probably not count as valid signal, automatically corrected at next tick

    ptt = TCNT1;                        // read tick timer
    TCNT1 = 0; // reset tick timer

    // asume no signal for this iteration at 'tickpointer'
    ticks.sensor5[tickpointer] = 0;
    ticks.sensor6[tickpointer] = 0;
    ticks.sensor10[tickpointer] = 0;

    if((TICK10LOW < ptt) && (ptt < TICK10HIGH))
    {
        // Tick 10 found
        ticks.tickcount10++;
        ticks.pulsecount10 += ptt;
        ticks.sensor10[tickpointer] = 10;
    }
    else
    {
        if((TICK6LOW < ptt) && (ptt < TICK6HIGH))
        {
            // Tick 6 found
            ticks.tickcount6++;
            ticks.pulsecount6 += ptt;
            ticks.sensor6[tickpointer] = 10;
        }
        else
        {
            if((TICK5LOW < ptt) && (ptt < TICK5HIGH))
            {
                // Tick 5 found
                ticks.tickcount5++;
                ticks.pulsecount5 += ptt;
                ticks.sensor5[tickpointer] = 10;
            }
        }
    }
    // next iteration to indicate change in signal quality
    tickpointer++;
    if(tickpointer > TICKSAMPLES-1) tickpointer = 0; // rollover
}

void setup() {
  Serial.begin(9600);
  clearSensorArrays();
  initCounter1();
  lcd.init();
  lcd.backlight();
  lcd.clear();
  
  lcd.printf("+------------------+");
  lcd.setCursor(0,1);
  lcd.printf("|   Horlogemeter   |");
  lcd.setCursor(0,2);
  lcd.printf("|   Versie 1.3     |");
  lcd.setCursor(0,3);
  lcd.printf("+------------------+");
  delay(1000);
  attachInterrupt(digitalPinToInterrupt(2), interrupt0, RISING);
}

void loop() {

  delay(1000);

  // tally sensor values
  temp5 = 0;
  temp6 = 0;
  temp10 = 0;
  for(i = 0; i < TICKSAMPLES; i++)
  {
    temp5 += ticks.sensor5[i];
    temp6 += ticks.sensor6[i];
    temp10 += ticks.sensor10[i];
  }
  if(temp5 >= 50)
  {
    current_ticks = 5;
    quality = temp5;
    // fast read to avoid race condition
    pulsecount = ticks.pulsecount5;
    tickcount  = ticks.tickcount5;
  }
  else
  {
    if(temp6 >= 50)
    {
        current_ticks = 6;
        quality = temp6;
        // fast read to avoid race condition
        pulsecount = ticks.pulsecount6;
        tickcount  = ticks.tickcount6;
    }
    else
    {
        if(temp10 >= 50)
        {
            current_ticks = 10;
            quality = temp10;
            // fast read to avoid race condition
            pulsecount = ticks.pulsecount10;
            tickcount  = ticks.tickcount10;
        }
        else 
        {
          current_ticks = 0;
          quality = 0;
        }
    }
  }
  if(current_ticks == 0)
  {
    lcd.clear(); 
    lcd.setCursor(4,1);
    lcd.printf("Geen signaal");
    maxsignalloss += 1; // signal lost in this period, set counter
    if(maxsignalloss > MAXSIGNALLOSS)
    {
      // reset all counters and re-acquire signal
      clearSensorArrays(); // reset all sensors for re-acquiry
      maxsignalloss = 0;
    }
  }
  else
  {
    // valid signal and average, calculate and print out results
    // calculate delta pulses per tick first (expected # pulses - pulsecount) / tickcount
    // then extrapolate to seconds per day
    secperday = ((((tickcount * 32768/current_ticks) - pulsecount) / tickcount)*3600*24/32768)-86400;

    lcd.clear();
    snprintf(displaytext,sizeof(displaytext),"Signaal %d%%",quality);
    lcd.print(displaytext);
    lcd.setCursor(0,1);
    snprintf(displaytext,sizeof(displaytext),"%d t/s",current_ticks);
    lcd.print(displaytext);
    lcd.setCursor(0,2);
    lcd.printf("%+06.1f sec/dag",secperday);
    lcd.setCursor(0,3);
    if(secperday > 0) lcd.printf("             Te snel");
    else lcd.printf("         Te langzaam");
    maxsignalloss = 0; // signal present, so reset counter
  }   
}