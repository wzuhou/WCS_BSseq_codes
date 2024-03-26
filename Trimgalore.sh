#!/bin/sh
# Grid Engine options
#$ -N trimgalore
#$ -cwd
#$ -l h_vmem=8G 
#$ -l h_rt=48:00:00
#$ -m baes
#$ -pe sharedmem 6

. /etc/profile.d/modules.sh
export OMP_NUM_THREADS=$NSLOTS
# Then, you must load the modules themselves
module load roslin/trimgalore/0.6.3
module load igmm/apps/pigz/2.3.3
for i in ` less ./Sample_BSDNA.txt`; do \
 for j in `less ./WCS/BSseq/Rawdata/${i}_list` ; do \
 input1=./WCS/BSseq/Rawdata/${i}/${j}1.fq.gz
 input2=./WCS/BSseq/Rawdata/${i}/${j}2.fq.gz
 echo "inputfile Forward R1: $input1 and Reverse R2 $input2"
 mkdir -p Trimmed_fq/${i}/
#echo "
trim_galore  -j 6 -paired -o ./Trimmed_fq/${i} --path_to_cutadapt ./Install/anaconda/env/py37/bin/cutadapt $input1 $input2
#"
 done
done

# -illumina #using illumina adapter
