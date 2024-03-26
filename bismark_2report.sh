#!/bin/sh
# Grid Engine options
#$ -N Breport
#$ -cwd
#$ -l h_vmem=12G 
#$ -l h_rt=48:00:00
#$ -M zwu33@ed.ac.uk
#$ -m baes
#$ -P roslin_smith_grp
#$ -pe sharedmem 2
# If you plan to load any software modules, then you must first initialise the modules framework.
. /etc/profile.d/modules.sh
# Choose the staging environment
export OMP_NUM_THREADS=$NSLOTS
#export PATH="$PATH:/exports/cmvm/eddie/eb/groups/smith_grp/Zhou_wu/Install/salmon/salmon-latest_linux_x86_64/bin"

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
#mkdir -p /exports/cmvm/eddie/eb/groups/smith_grp/Zhou_wu/WCS/BSseq/Methy_extract && cd $_

/exports/igmm/software/pkg/el7/apps/bismark/0.22.3/bismark2report -o Report_${i}.html --dir /exports/cmvm/eddie/eb/groups/smith_grp/Zhou_wu/WCS/BSseq/mapping/dedup/${i}/ \
 --alignment_report /exports/cmvm/eddie/eb/groups/smith_grp/Zhou_wu/WCS/BSseq/mapping/$i/*_PE_report.txt \
 --dedup_report /exports/cmvm/eddie/eb/groups/smith_grp/Zhou_wu/WCS/BSseq/mapping/dedup/${i}/*multiple.deduplication_report.txt \
 --splitting_report /exports/cmvm/eddie/eb/groups/smith_grp/Zhou_wu/WCS/BSseq/mapping/dedup/${i}/*deduplicated_splitting_report.txt

# --parallel 6 broken job
#done
#done

