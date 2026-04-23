// Get register definitions with auto complete
#include <atmega32/io.h>

// For delay functions: F_CPU has to be defined
#include <util/delay.h>


int main (void)
{
    while(1){
        PORTC = (PORTC & 0xF8) | 0x01; // Clear pins 0,1,2 and set pin 0 of PORTC to high
        _delay_ms(1000); // Wait for 1 second
        
        PORTC = (PORTC & 0xF8) | 0x02; // Clear pins 0,1,2 and set pin 1 of PORTC to high
        _delay_ms(1000); // Wait for 1 second

        PORTC = (PORTC & 0xF8) | 0x04; // Clear pins 0,1,2 and set pin 2 of PORTC to high
        _delay_ms(1000); // Wait for 1 second
    }
    // Should never be reached
    return 0;
}
