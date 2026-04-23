// Get register definitions with auto complete
#include <atmega32/io.h>

// For delay functions: F_CPU has to be defined
#include <util/delay.h>
# define F_CPU 1000000UL


int main (void)
{
    DDRC = 0x01; // Set pin 0 of PORTC as output
    while(1){
        PORTC |= (1 << PC0); // Set pin 0 of PORTC to high
        _delay_ms(1000); // Wait for 1 second
        
        PORTC &= ~(1 << PC0); // Set pin 0 of PORTC to low
        _delay_ms(1000); // Wait for 1 second
    }
    
    // Should never be reached
    return 0;
}
