#include <stdio.h>
#include <stdlib.h>
#include <time.h> // biblioteca donde se encuentra la función clock_gettime()

#define PRUEBAS
int main(int argc, char **argv) {

    int fil;
    printf("\nIntroduce el tamaño de la matriz cuadrada: ");
    scanf("%d", &fil );

    //Reservamos memoria
    int *v= (int*) malloc(fil*sizeof(int));
    int *resultado = (int*) malloc(fil*sizeof(int));
	int **matriz = (int **)malloc(fil*sizeof(int*));
    for(int i = 0; i < fil; i++){
        matriz[i] = (int*)malloc(fil*sizeof(int)); 
		if(matriz[i] == NULL) perror("Error: ");
    }

    //Inicializamos la matriz
    for(int f = 0; f < fil; f++){
        for(int c = 0; c < fil; c++)
            matriz[f][c] = 2.0;
    }
    //Inicializamos los vectores tanto v como donde se guardara el resultado
    for(int c = 0; c < fil; c++){
        v[c] = 3.0;
        resultado[c] = 0;
    }

	struct timespec cgt1,cgt2;
    double ncgt; //para tiempo de ejecución

	clock_gettime(CLOCK_REALTIME,&cgt1);


    for(int f = 0; f < fil; f++){
        for(int c = 0; c < fil; c++)
            resultado[f] += v[f]*matriz[f][c];
    }
	clock_gettime(CLOCK_REALTIME,&cgt2);
    ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+ (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

    //imprimimimos los datos
    #ifdef PRUEBAS
    printf("La matriz inicializada es:\n");
    for(int f = 0; f < fil; f++){
        printf("[");;
        for(int c = 0; c < fil-1; c++)
           printf("%d,",matriz[f][c]);
        printf("%d]\n",matriz[fil-1][fil-1]);


    }
    printf("El vector inicializado es:\n");
    for(int c = 0; c < fil; c++){
        printf("[%d]\n",v[c]);
    }
    printf("El resultado de multiplicarlo es:\n");
    for(int c = 0; c < fil; c++){
        printf("[%d]\n",resultado[c]);
    }
    printf("El tiempo usado es%f:\n",ncgt);

    #else
        printf("Primero:%d Ultimo:%d %f \n",resultado[0],resultado[fil-1],ncgt);

    #endif
    free(matriz);
    free(v);
    free(resultado);

    return 0;
}