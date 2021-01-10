/*
Horlogemeter

Counts 32.768Hz reference clock on pin PD5/T1
While a mechanical watch amplifier generates tick interrupts to pin PD2
Every interrupt tick, an array of 5/6/10 tick is updated, to calculate the signal validity, and the T1 counter is reset to 0

the running sensor5/6/10 arrays note 10 values of the sensor
Given a tick5 watch, it takes two (2) seconds for the array to display 100% sensor value, which seems ok at this point

*/

// ------- Preamble -------- //
#define BAUD 9600
#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include "USART.h"
#include <avr/power.h>

//#define PULSESPERDAY 32768*3600*24  // number of real-time clock pulses/day
#define TICKSAMPLES 10
#define SENSORSAMPLES 20

volatile uint8_t tickpointer; // points to item in arrray of tick values
volatile uint8_t sensor5[TICKSAMPLES];
volatile uint8_t sensor6[TICKSAMPLES];
volatile uint8_t sensor10[TICKSAMPLES];
volatile uint16_t ptt; // previously read tick time;
volatile uint16_t sensorvalues[SENSORSAMPLES];
volatile uint32_t sum;
volatile uint16_t valuecounter;

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
    sum = 0;
    valuecounter = 0;
    for(i = 0; i < SENSORSAMPLES; i++) sensorvalues[i] = 0;
}

void initInterrupt0(void)
{
    EIMSK |= (1 << INT0);   // enable INT0
    EICRA |= (1 << ISC00);  // trigger on rising edge
    EICRA |= (1 << ISC01);
    sei();
}

void initCounter1(void)
{
    TCCR1A = 0; // normal mode, counter
    // Set external clock source on T1 pin, clock on rising edge:
    TCCR1B |= ((1 << CS10) | (1 << CS11) | (1 << CS12));
    TCNT1 = 0; // reset counter immediately, perhaps not needed
}

ISR(INT0_vect) {         /* Run every time there is a change on button */
    ptt = TCNT1;                        // read tick timer

    if((3113 < ptt) && (ptt < 3441))
    {
        // Tick 10 found with +/- 5% margin
        sensor10[tickpointer] = 1;
        sum = sum - sensorvalues[valuecounter] + ptt; // update new sum
        sensorvalues[valuecounter] = ptt; // record new sensor value
        valuecounter++; // next valuecounter
    }
    else
    {
        sensor10[tickpointer] = 0;
        if((5188 < ptt) && (ptt < 5734))
        {
            // Tick 6 found with +/- 5% margin
            sensor6[tickpointer] = 1;
            sum = sum - sensorvalues[valuecounter] + ptt; // update new sum
            sensorvalues[valuecounter] = ptt; // record new sensor value
            valuecounter++; // next valuecounter
        }
        else
        {
            sensor6[tickpointer] = 0;
            if((6225 < ptt) && (ptt < 6880))
            {
                // Tick 5 found with +/- 5% margin
                sensor5[tickpointer] = 1;
                sum = sum - sensorvalues[valuecounter] + ptt; // update new sum
                sensorvalues[valuecounter] = ptt; // record new sensor value
                valuecounter++; // next valuecounter
            }
            else sensor5[tickpointer] = 0;
        }
    }
    tickpointer++;
    if(tickpointer > TICKSAMPLES-1) tickpointer = 0; // rollover
    if(valuecounter > SENSORSAMPLES-1) valuecounter = 0; // rollover
    TCNT1 = 0; // reset tick timer
}


int main(void) {
  uint8_t temp5, temp6, temp10, i;
  uint8_t ticks = 0;
  uint8_t counter = 0;
  uint32_t avg;
  int32_t difference;
  // -------- Inits --------- //
  initUSART();
  clearSensorArrays();
  initCounter1();
  initInterrupt0();
  
  printString("\r\n== Sensor readings ==\r\n"); 
  printString("Tick#  05 06 10\r\n");
  // ------ Event loop ------ //
  while (1) {
       _delay_ms(1000);
     
      // tally sensor values
      avg = sum / SENSORSAMPLES;
      temp5 = 0;
      temp6 = 0;
      temp10 = 0;
      for(i = 0; i < TICKSAMPLES; i++)
      {
        temp5 += sensor5[i];
        temp6 += sensor6[i];
        temp10 += sensor10[i];
      }

      if(temp5 > 6)
      {
        ticks = 5;
      }
      else
      {
        if(temp6 > 6)
        {
            ticks = 6;
        }
        else
        {
            if(temp10 > 6)
            {
                ticks = 10;
            }
            else ticks = 0;
        }
      }

      printString("Run ");
      printHexByte(counter);
      printString(" ");
      printHexByte(ticks);
      printString(" ");
      printHexByte(temp5);
      printString(" ");
      printHexByte(temp6);
      printString(" ");
      printHexByte(temp10);
      printString(" average - ");
      printHexByte((avg >> 24) & 0xFF);
      printHexByte((avg >> 16) & 0xFF);
      printHexByte((avg >> 8) & 0xFF);
      printHexByte(avg & 0xFF);
      if(ticks)
      {
         difference = ((32768-(avg*ticks))*3600*24)/32768;
         printString("  difference - ");
         printHexByte((difference >> 24) & 0xFF);
         printHexByte((difference >> 16) & 0xFF);
         printHexByte((difference >> 8) & 0xFF);
         printHexByte(difference & 0xFF);
      }
      else printString(" === No watch detected");
      counter++;
      printString("\r\n");
  }                                                  /* End event loop */
  return 0;
}
