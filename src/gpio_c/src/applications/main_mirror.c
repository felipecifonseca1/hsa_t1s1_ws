// Get register definitions with auto complete
#include <atmega32/io.h>

// For delay functions: F_CPU has to be defined
#include <util/delay.h>
# define F_CPU 1000000UL

int main (void)
{   

    DDRC &= ~(1 << PC4); // Set pin 4 of PORTC as input
    DDRC |= (1 << PC3); // Set pin 3 of PORTC as output
    while (1){
        if(PINC & (1 << PC4))
        {
            // set output of pin 1 on port C to high
            PORTC |= (1 << PC3);
        }
        else
        {
            // set output of pin 1 on port C to low
            PORTC &= ~(1 << PC3);

        }
        _delay_ms(1000); // Wait for 1 second
    }
    // Should never be reached
    return 0;
}
