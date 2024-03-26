#!/bin/sh
# Grid Engine options
#$ -N trimgalore
#$ -cwd
#$ -l h_vmem=8G 
#$ -l h_rt=48:00:00
#$ -M zwu33@ed.ac.uk
#$ -m baes
#$ -P roslin_smith_grp
#$ -pe sharedmem 6

. /etc/profile.d/modules.sh
export OMP_NUM_THREADS=$NSLOTS
# Then, you must load the modules themselves
#module load igmm/apps/cutadapt/1.9.1
module load roslin/trimgalore/0.6.3
#module load roslin/fastqc/0.11.7
 module load igmm/apps/pigz/2.3.3
for i in ` less ./Sample_BSDNA.txt`; do \

 for j in `less /exports/cmvm/eddie/eb/groups/smith_grp/Zhou_wu/WCS/BSseq/Rawdata/${i}_list` ; do \
 input1=/exports/cmvm/eddie/eb/groups/smith_grp/Zhou_wu/WCS/BSseq/Rawdata/${i}/${j}1.fq.gz
 input2=/exports/cmvm/eddie/eb/groups/smith_grp/Zhou_wu/WCS/BSseq/Rawdata/${i}/${j}2.fq.gz
echo "inputfile Forward R1: $input1 and Reverse R2 $input2"
mkdir -p Trimmed_fq/${i}/
#echo "
trim_galore  -j 6 -paired -o ./Trimmed_fq/${i} --path_to_cutadapt /exports/cmvm/eddie/eb/groups/smith_grp/Zhou_wu/Install/anaconda/env/py37/bin/cutadapt $input1 $input2
#"
done
done

# -illumina #using illumina adapter
