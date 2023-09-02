#include <stdio.h>
#include <time.h>
#include <stdlib.h>

int divisores(int numero) {
    int suma = 0;
    if (numero != 1) { // Para numeros mayores a 1
        for(int i=1 ; i<numero ; i++) {
            if (numero % i == 0)
                suma += i;
        }
    }
    else    // En caso del numero 1
        suma = 1;
    return suma;
}

int main() {
    srand(time(NULL));

    int aleatorio[15]; //Arreglo de 15 elementos

    printf("El arreglo es: ");
    for(int i=0 ; i<15 ; i++) {
        aleatorio[i] = rand() %  100 + 1; //Numeros aleatorios entre 1 y 100
        printf("%d ", aleatorio[i]);
    }
    
    printf("\n");

    for (int j=0 ; j<15 ; j++) {
        int sumDivisores = divisores(aleatorio[j]);
        if (sumDivisores < aleatorio[j])
            printf("%d - Deficiente \n", aleatorio[j]);
        else if (sumDivisores == aleatorio[j])
            printf("%d - Perfecto \n", aleatorio[j]);
        else
            printf("%d - Abundante \n", aleatorio[j]);;
    }
    
    return 0;
}