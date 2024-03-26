#!/bin/sh
###########################################
#                                         #
# Submit a job which uses some installed  #
# applications, using:                    #
# "module load <application>"             #
#                                         #
###########################################
 
# Grid Engine options
#$ -N fastqc
#$ -cwd
#$ -l h_vmem=4G 
#$ -pe sharedmem 8
#$ -m baes



# If you plan to load any software modules, then you must first initialise the modules framework.
. /etc/profile.d/modules.sh

export OMP_NUM_THREADS=$NSLOTS

# Then, you must load the modules themselves
module load java
module load roslin/fastqc/0.11.7
module load roslin/mamba/1.0
source activate py37

multiqc mapping/ -o multiqc -n BS_mapping
#multiqc ./RNA_LALO/fastqc -o ./RNA_LALO/fastqc/ -n 193_Heart_random
