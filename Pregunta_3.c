#include <stdio.h>
#include <stdint.h>

int main() {
  // Punteros para MCUCR
  volatile uint8_t* mcucr = (volatile uint8_t*) 0x55;

  // Punteros para PC2
  volatile uint8_t* portC = (volatile uint8_t*) 0x28;
  volatile uint8_t* ddrC = (volatile uint8_t*) 0x27;
  volatile uint8_t* pinC = (volatile uint8_t*) 0x26;

  // Punteros para PB5
  volatile uint8_t* portB = (volatile uint8_t*) 0x25;
  volatile uint8_t* ddrB = (volatile uint8_t*) 0x24;

  // MCUCR, bit 4 en alta
  *mcucr |= (1 << 4);
  
  // PORTC, bit 2 en alta
  *portC |= (1 << 2);
  // DDRC, bit 2 en baja (pin de entrada)
  *ddrC &= ~(1 << 2);

  // PORTB, bit 5 en baja
  *portB &= ~(1 << 5);
  // DDRB, bit 5 en alta (pin de salida)
  *ddrB |= (1 << 5);

  while (1) {
    uint8_t estado = *pinC & 0b00000100;
    if (estado == 1)
      *portB |= (1 << 5);
    else
      *portB &= ~(1 << 5);
  }

  return 0;
}