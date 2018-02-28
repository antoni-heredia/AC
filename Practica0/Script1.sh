#!/bin/bash
#Se asigna al trabajo el nombre SumaVectoresC_vlocales
#PBS -N SumaVectoresC_vlocales
#Se asigna al trabajo la cola ac
#PBS -q ac  
for ((N=65536;N<67108865;N=N*2))
do
	./SumaVectoresCDinamicos $N
done
