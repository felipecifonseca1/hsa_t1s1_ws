#include <atmega32/asm/io.h>

.global main

main:
    sbi DDRC, 3
    cbi DDRC, 4
    main_loop:

      sbic PINC, 4        ; Skip next instruction if PINC4 is Clear (0)
      sbi PORTC, 3        ; set Bit in I/O Register (Pin 3)

      sbis PINC, 4        ; Skip next instruction if PINC4 is Set (1)
      cbi PORTC, 3        ; clear Bit in I/O Register (Pin

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