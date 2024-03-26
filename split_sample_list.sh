#!/bin/bash
for i in `seq 24 -6 1`; do \
I=$((${i}-5))
echo $I  $i 
sed -n ${I},${i}p Sample_BSDNA.txt >Sample_BSDNA.txt.${I}_${i}
done
