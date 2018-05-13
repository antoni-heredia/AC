#include <stdio.h>
#include <stdlib.h>
#include <time.h> // biblioteca donde se encuentra la función clock_gettime()
#include <omp.h>

//#define PRUEBAS
int main(int argc, char **argv) {

    int fil;
	#ifdef PRUEBAS
		printf("\nIntroduce el tamaño de la matriz cuadrada: ");
		scanf("%d", &fil );
	#else
		fil = atoi(argv[1]);
	#endif
    //Reservamos memoria
    int *v= (int*) malloc(fil*sizeof(int));
    int *resultado = (int*) malloc(fil*sizeof(int));
	int **matriz = (int **)malloc(fil*sizeof(int*));
    for(int i = 0; i < fil; i++){
        matriz[i] = (int*)malloc(fil*sizeof(int)); 
		if(matriz[i] == NULL) perror("Error: ");
    }

	double start, end , diferencia;  

    #pragma omp parallel
    {
    //Inicializamos los datos
    #pragma omp for
        for(int f = 0; f < fil; f++){
            v[f] = 3.0;
            resultado[f] = 0;
                for(int c = 0; c < fil; c++)
                    matriz[f][c] = 2.0;
        }
    
    #pragma single
        start = omp_get_wtime();
     #pragma omp for
        for(int f = 0; f < fil; f++){
            for(int c = 0; c < fil; c++)
                resultado[f] += v[f]*matriz[f][c];
        }
    #pragma single
        end = omp_get_wtime();    
    }

	diferencia=end-start;

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
    printf("El tiempo usado es%f:\n",diferencia);

    #else
        //Lo imprimo por la salida de errores para coger solo los tiempos
		fprintf( stderr, "Primero:%d Ultimo:%d\n", resultado[0],resultado[fil-1]);
        printf("Tiempo:%f \n",diferencia);

    #endif
    free(matriz);
    free(v);
    free(resultado);

    return 0;
}