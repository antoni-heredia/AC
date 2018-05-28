#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
#include <omp.h>
#else
#define omp_get_thread_num() 0
#endif
int main(int argc, char **argv)
{
	int i, n = 200, chunk, a[n], suma = 0;
	omp_sched_t tipo_schedule;
	int valor_chunk;
	if (argc < 3)
	{
		fprintf(stderr, "\nFalta iteraciones o chunk \n");
		exit(-1);
	}
	n = atoi(argv[1]);
	if (n > 200)
		n = 200;
	chunk = atoi(argv[2]);
	for (i = 0; i < n; i++)
		a[i] = i;
#pragma omp parallel for firstprivate(suma) lastprivate(suma) schedule(dynamic, chunk)
	for (i = 0; i < n; i++)
	{
		suma = suma + a[i];
		printf(" thread %d suma a[%d]=%d suma=%d \n",
			   omp_get_thread_num(), i, a[i], suma);
		if (omp_get_thread_num() == 0)
		{
			printf(" Dentro de 'parallel for antes modificarlo':\n");

			omp_get_schedule(&tipo_schedule, &valor_chunk);
			printf(" thread-limit-var:%d, nthreads-var:%d,  dyn-var: %d,  run-sched-var: %d, chunk: %d\n",
				   omp_get_thread_limit(),omp_get_max_threads(), omp_get_dynamic() ,  tipo_schedule, valor_chunk);
				   
		}
	}
	printf("Fuera de 'parallel for' suma=%d\n", suma);

	// Cambiamos los valores
	omp_set_dynamic(3);
	omp_set_num_threads(3);
	omp_set_schedule(3, 3);
	printf("Despues de modificarlo\n");

	omp_get_schedule(&tipo_schedule, &valor_chunk);

	printf(" thread-limit-var:%d, nthreads-var:%d,  dyn-var: %d,  run-sched-var: %d, chunk: %d\n",
				   omp_get_thread_limit(),omp_get_max_threads(), omp_get_dynamic() ,  tipo_schedule, valor_chunk);
	return 0;
}