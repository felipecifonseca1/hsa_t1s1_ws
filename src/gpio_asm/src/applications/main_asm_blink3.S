#include <atmega32/asm/io.h>

.global main

main:
    in  r18, DDRC
    ori r18, 0x07         ; (Pins 0, 1, 2)
    out DDRC, r18

    main_loop:

        in r19, PORTC         ; read current state of PORTC
        andi r19, 0xF8        ; LOW pins 0-2
        ori r19, 0x01         ; HIGH pin 0
        out PORTC, r19        ; write back to PORTC

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
        andi r19, 0xF8        ; LOW pins 0-2
        ori r19, 0x02         ; HIGH pin 1
        out PORTC, r19        ; write back to PORTC

   
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
        andi r19, 0xF8        ; LOW pins 0-2
        ori r19, 0x04         ; HIGH pin 2
        out PORTC, r19        ; write back to PORTC

        ;delay (1s)
        ldi r18, 0x3F
        ldi r24, 0x0D
        ldi r25, 0x03
      1:subi r18, 0x01
        sbci r24, 0x00
        sbci r25, 0x00
        brne 1b ; local label backward
        rjmp 1f ; local label forward
      1:nop

        rjmp main_loop          ; repeat the loop

    ret                         ; exit, should never be reached

.end