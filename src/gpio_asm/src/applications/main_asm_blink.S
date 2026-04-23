#include <atmega32/asm/io.h>

.global main

main:
    ldi r18, 0x0F          ; set PORTC pins 0-3 as output
    out DDRC, r18;

    main_loop:
        ; set HIGH
        in r19, PORTC         ; read current state of PORTC
        ori r19, 0x01         ; HIGH pin 0
        out PORTC, r19        ; write back to PORTC

        ;sbi PORTC, 0    ; set Bit in I/O Register (Pin 0)

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

        ; set LOW
        in r19, PORTC         ; read current state of PORTC
        andi r19, 0xFE        ; LOW pin 0
        out PORTC, r19        ; write back to PORTC

        ;cbi PORTC, 0    ; clear Bit in I/O Register (Pin 0)

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

        rjmp main_loop          ; repeat the loop

    ret                         ; exit, should never be reached

.end