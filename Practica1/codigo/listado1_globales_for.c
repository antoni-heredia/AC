
#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h> // biblioteca donde se encuentra la función printf()
#include <time.h> // biblioteca donde se encuentra la función clock_gettime()
#include <omp.h> 

//#define  PRINTF_ALL
#define MAX 67108864
double v1[MAX], v2[MAX], v3[MAX];

int main(int argc, char** argv)
{
	int i;
	//Leer argumento de entrada (nº de componentes del vector)
	if (argc<2)
	{
		printf("Faltan nº componentes del vector\n");
		exit(-1);
	}


	unsigned int N = atoi(argv[1]); // Máximo N =2^32-1=4294967295 (sizeof(unsigned int) = 4 B)
	double start, end , diferencia;  
    #pragma omp parallel 
    {
		//Inicializar vectores
		#pragma omp for
		for(i=0; i<N; i++){
			v1[i] = N*0.1+i*0.1; v2[i] = N*0.1-i*0.1; //los valores dependen de N
		}
		#pragma single
			start = omp_get_wtime(); 
		//Calcular suma de vectores
		#pragma omp for
		for(i=0; i<N; i++)
			v3[i] = v1[i] + v2[i];

		#pragma single
		end = omp_get_wtime(); 
	}
	diferencia=end-start;
	//Imprimir resultado de la suma y el tiempo de ejecución
#ifdef PRINTF_ALL
	printf("Tiempo(seg.):%11.9f\t Tamaño Vectores:%u\n",diferencia,N);
	for(i=0; i<N; i++)
		printf("V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) \n", i,i,i,v1[i],v2[i],v3[i]);
#else
	printf("%d %11.9f\n",N, diferencia);
#endif
	
	return 0;
}
