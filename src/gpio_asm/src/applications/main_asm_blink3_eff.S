#include <atmega32/asm/io.h>

.global main

main:
    in  r18, DDRC
    ori r18, 0x07         ; (Pins 0, 1, 2)
    out DDRC, r18

    main_loop:

        in r19, PORTC         ; 1 cycle - Read state into r19
        andi r19, 0xF8        ; 1 cycle - Mask out pins 0-2
        ori r19, 0x01         ; 1 cycle - Set pin 0
        out PORTC, r19        ; 1 cycle - Write back

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

        in r19, PORTC         ; 1 cycle - Read state into r19
        andi r19, 0xF8        ; 1 cycle - Mask out pins 0-2
        ori r19, 0x02         ; 1 cycle - Set pin 1
        out PORTC, r19        ; 1 cycle - Write back

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

        in r19, PORTC         ; 1 cycle - Read state into r19
        andi r19, 0xF8        ; 1 cycle - Mask out pins 0-2
        ori r19, 0x04         ; 1 cycle - Set pin 2
        out PORTC, r19        ; 1 cycle - Write back

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