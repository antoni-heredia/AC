#!/bin/bash
#Se asigna al trabajo el nombre SumaVectoresC_vlocales
#PBS -N pmvA10000
#Se asigna al trabajo la cola ac
#PBS -q ac 
echo "Ejecucion para 15000"
for ((N=1;N<=8;N=N+1))
do
	export OMP_NUM_THREADS=$N
	 ./pmv-OpenmMP-reduction.out  15000
done
echo "Ejecucion para 50000"
for ((N=1;N<=8;N=N+1))
do
	export OMP_NUM_THREADS=$N
	 ./pmv-OpenmMP-reduction.out  50000
done