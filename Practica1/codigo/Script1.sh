#!/bin/bash
#Se asigna al trabajo el nombre SumaVectoresC_vlocales
#PBS -N SumaVectoresC_vlocales
#Se asigna al trabajo la cola ac
#PBS -q ac  
for ((N=16384;N<=67108864;N=N*2))
do
	./listado1_globales_section.out $N
done
