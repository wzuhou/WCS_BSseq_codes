#!/bin/sh
###########################################
#                                         #
# Submit a job which uses some installed  #
# applications, using:                    #
# "module load <application>"             #
#                                         #
###########################################
 
# Grid Engine options
#$ -N m_bismark
#$ -cwd
#$ -l h_vmem=8G 
#$ -l h_rt=60:00:00
#$ -M zwu33@ed.ac.uk
#$ -m baes
#$ -P roslin_smith_grp
#$ -pe sharedmem 16
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
#module load roslin/samtools/1.10
module load igmm/apps/pigz/2.3.3

#mapping
#for i in ` less ./${1} `; do \
#for i in ` less ./Sample_BSDNA.txt.1_6`; do \
#i="DNA_CER104G#81"
i=$1
date
echo "START: ${i}"
mkdir -p /exports/cmvm/eddie/eb/groups/smith_grp/Zhou_wu/WCS/BSseq/mapping/${i} && cd $_
for j in `less /exports/cmvm/eddie/eb/groups/smith_grp/Zhou_wu/WCS/BSseq/Rawdata/${i}_list`; do \
#j="V350089372_L03_ZONjrbsH006632-1_"
input1=/exports/cmvm/eddie/eb/groups/smith_grp/Zhou_wu/WCS/BSseq/Trimmed_fq/${i}/${j}1_val_1.fq.gz
input2=/exports/cmvm/eddie/eb/groups/smith_grp/Zhou_wu/WCS/BSseq/Trimmed_fq/${i}/${j}2_val_2.fq.gz
#ls $input1
#ls $input2
bismark --genome /exports/cmvm/eddie/eb/groups/smith_grp/Zhou_wu/WCS/BSseq/genome/ -1 $input1 -2 $input2 -o /exports/cmvm/eddie/eb/groups/smith_grp/Zhou_wu/WCS/BSseq/mapping/${i}/ --samtools_path /exports/cmvm/eddie/eb/groups/smith_grp/Zhou_wu/Install/anaconda/env/py37/bin/ --path_to_bowtie2 /exports/cmvm/eddie/eb/groups/smith_grp/Zhou_wu/Install/bowtie2/bowtie2-2.5.1/ -p 2 --parallel 4
done
#done

