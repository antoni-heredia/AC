#include <stdio.h>
#include <stdlib.h>
#include <time.h> // biblioteca donde se encuentra la función clock_gettime()

#define PRUEBAS
int main(int argc, char **argv) {

    int fil;
    printf("\nIntroduce el tamaño de la matriz cuadrada: ");
    scanf("%d", &fil );

    //Reservamos memoria
    int **matriz1= (int **)malloc(fil*sizeof(int*));
    int **resultado = (int **)malloc(fil*sizeof(int*));
	int **matriz2 = (int **)malloc(fil*sizeof(int*));
    for(int i = 0; i < fil; i++){
        matriz2[i] = (int*)malloc(fil*sizeof(int));
		matriz1[i] = (int*)malloc(fil*sizeof(int)); 
		resultado[i] = (int*)malloc(fil*sizeof(int));  
		if(matriz2[i] == NULL) perror("Error: ");
    }

    //Inicializamos la matriz2
    for(int f = 0; f < fil; f++){
        for(int c = 0; c < fil; c++){
            matriz2[f][c] = 2.0;
            matriz1[f][c] = 3.0;
            resultado[f][c] = 0;

		}
    }
    

	struct timespec cgt1,cgt2;
    double ncgt; //para tiempo de ejecución

	clock_gettime(CLOCK_REALTIME,&cgt1);


    for(int f = 0; f < fil; f++){
        for(int c = 0; c < fil; c++)
			for(int j = 0; j < fil; j++)
            resultado[f][c] += matriz1[f][j]*matriz2[j][c];
    }

	clock_gettime(CLOCK_REALTIME,&cgt2);
    ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+ (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

    //imprimimimos los datos
    #ifdef PRUEBAS
    printf("La matriz2 inicializada es:\n");
    for(int f = 0; f < fil; f++){
        printf("[");;
        for(int c = 0; c < fil-1; c++)
           printf("%d,",matriz2[f][c]);
        printf("%d]\n",matriz2[fil-1][fil-1]);


    }
    printf("El matriz1 inicializado es:\n");
    for(int f = 0; f < fil; f++){
        printf("[");;
        for(int c = 0; c < fil-1; c++)
           printf("%d,",matriz1[f][c]);
        printf("%d]\n",matriz1[fil-1][fil-1]);


    }
    printf("El resultado de multiplicarlo es:\n");
	for(int f = 0; f < fil; f++){
        printf("[");;
        for(int c = 0; c < fil-1; c++)
           printf("%d,",resultado[f][c]);
        printf("%d]\n",resultado[fil-1][fil-1]);


    }

    printf("El tiempo usado es%f:\n",ncgt);

    #else
        printf("Primero:%d Ultimo:%d %f \n",resultado[0],resultado[fil-1],ncgt);

    #endif
    free(matriz2);
    free(matriz1);
    free(resultado);

    return 0;
}