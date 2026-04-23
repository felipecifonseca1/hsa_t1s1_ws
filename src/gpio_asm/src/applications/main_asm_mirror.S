#include <atmega32/asm/io.h>

.global main

main:

    sbi PORTC, 3    ; set Bit in I/O Register (Pin 3)
    sbic PINC, 4;
    cbi PORTC, 3    ; set Bit in I/O Register (Pin 3)
    

    ; delay (1s)
    ldi r18, 0x3F
    ldi r24, 0x0D
    ldi r25, 0x03
  1:subi r18, 0x01
    sbci r24, 0x00
    sbci r25, 0x00
    brne 1b ; local label backward
    rjmp 1f ; local label forward
  1:nop

    in r19, PORTC         ; read current state of PORTC
    ori r19, 0x08         ; HIGH pin 0
    out PORTC, r19        ; write back to PORTC


    ret                         ; exit, should never be reached

.end