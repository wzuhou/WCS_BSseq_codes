#!/bin/sh
 
# Grid Engine options
#$ -N g_bismark
#$ -cwd
#$ -l h_vmem=256G 
#$ -l h_rt=48:00:00
#$ -M zwu33@ed.ac.uk
#$ -m baes
#$ -P roslin_smith_grp
#'$ -pe sharedmem 8

. /etc/profile.d/modules.sh
# Choose the staging environment
export OMP_NUM_THREADS=$NSLOTS
#export PATH="$PATH:/exports/cmvm/eddie/eb/groups/smith_grp/Zhou_wu/Install/salmon/salmon-latest_linux_x86_64/bin"
export PATH=$PATH:/exports/igmm/software/pkg/el7/apps/bowtie/2.4.2/
#module load roslin/mamba/1.0
#source activate py37
module load igmm/apps/HISAT2/2.1.0
#bismark
module load igmm/apps/bismark/0.22.3
module load igmm/apps/bowtie/2.4.2

#prepare genome
/exports/igmm/software/pkg/el7/apps/bismark/0.22.3/bismark_genome_preparation \
 --path_to_aligner /exports/igmm/software/pkg/el7/apps/bowtie/2.4.2/ \
 --verbose \
 --bowtie2  /exports/cmvm/eddie/eb/groups/smith_grp/Zhou_wu/WCS/BSseq/genome/

###################
