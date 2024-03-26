#!/bin/sh
# Grid Engine options
#$ -N d_bismark
#$ -cwd
#$ -l h_vmem=12G 
#$ -l h_rt=48:00:00
#$ -m baes
#$ -pe sharedmem 4

# If you plan to load any software modules, then you must first initialise the modules framework.
. /etc/profile.d/modules.sh
# Choose the staging environment
export OMP_NUM_THREADS=$NSLOTS

module load roslin/mamba/1.0
source activate py37
#bismark
module load igmm/apps/bismark/0.22.3
module load igmm/apps/bowtie/2.4.2
module load igmm/apps/pigz/2.3.3
#mapping
#for i in ` less ./Sample_BSDNA.txt`; do \
#i="DNA_CER104G#81"
i=$1
mkdir -p ./WCS/BSseq/mapping/dedup/$i && cd $_
#for j in `less ./WCS/BSseq/Rawdata/${i}_list`; do \
#j="V350089372_L03_ZONjrbsH006632-1_"
#run deduplicate_bismark with the option --multiple, which will do the merging and deduplication for your.
/exports/igmm/software/pkg/el7/apps/bismark/0.22.3/deduplicate_bismark  ./BSseq/mapping/${i}/*.bam --samtools_path ./Install/anaconda/env/py37/bin/ --output_dir ./WCS/BSseq/mapping/dedup/$i --outfile ${i}.multiple.deduplicated.bam --multiple --paired 
# --parallel 6 broken job
#done
#done

