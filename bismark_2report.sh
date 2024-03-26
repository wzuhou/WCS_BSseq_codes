#!/bin/sh
# Grid Engine options
#$ -N Breport
#$ -cwd
#$ -l h_vmem=12G 
#$ -l h_rt=48:00:00
#$ -m baes
#$ -pe sharedmem 2
# If you plan to load any software modules, then you must first initialise the modules framework.
. /etc/profile.d/modules.sh
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
#mkdir -p ./WCS/BSseq/Methy_extract && cd $_

/exports/igmm/software/pkg/el7/apps/bismark/0.22.3/bismark2report -o Report_${i}.html --dir ./WCS/BSseq/mapping/dedup/${i}/ \
 --alignment_report ./WCS/BSseq/mapping/$i/*_PE_report.txt \
 --dedup_report ./WCS/BSseq/mapping/dedup/${i}/*multiple.deduplication_report.txt \
 --splitting_report ./WCS/BSseq/mapping/dedup/${i}/*deduplicated_splitting_report.txt

# --parallel 6 broken job
#done
#done

