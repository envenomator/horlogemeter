/*
Counts an external 32Khz reference source on pin PD5/T1
and prints to serial

*/

// ------- Preamble -------- //
#include <avr/io.h>
#include <util/delay.h>
#include "pinDefines.h"
#include "USART.h"
#include <avr/power.h>

int main(void) {
  uint32_t counter = 0;
  uint8_t teller = 0;
  uint16_t temp = 0;
  uint8_t highbyte, lowbyte;
  // -------- Inits --------- //
  initUSART();
  DDRB |= 1 << PB0; // output LED0
  printString("\r\n== External counter ==\r\n");                          /* to test */
  TCCR1A = 0; // normal mode, counter
  // Set external clock source on T1 pin, clock on rising edge:
  TCCR1B |= ((1 << CS10) | (1 << CS11) | (1 << CS12));

  // ------ Event loop ------ //
  while (1) {
   TCNT1 = 0; // reset every delay()
   _delay_ms(1010);
   PORTB ^= 1 << PB0; // toggle LED0
   temp = TCNT1;
   // actual measurement will be longer than 1sec (0,3% longer)
   // counter += temp;
   highbyte = (temp >> 8) & 0xff;
   lowbyte = (temp & 0xff);
   // print header column
   //printHexByte(teller);
   //printString(" ");

   printHexByte(highbyte);
   printHexByte(lowbyte);
//   printHexByte((counter >> 24) & 0xff);
//   printHexByte((counter >> 16) & 0xff);
//   printHexByte((counter >> 8) & 0xff);
//   printHexByte((counter & 0xff));
   printString("\r\n");
   //teller++;
  }                                                  /* End event loop */
  return 0;
}
