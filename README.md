# WCS_BSseq_codes
This repository is for analyzing Whole Genome Bisulfite Sequencing in White-crowed sparrow

Author: Z.WU

Date:2023.Jan

## Pipeline

```mermaid
%%{init: {'theme':'default'}}%%
stateDiagram-v2
    Fastq --> Trimgalore : Trimming
    	note right of Fastq: fastqc
    Trimgalore --> Bismark
    state Bismark{
     direction LR
    Mapping --> Deduplication
    Deduplication --> Call_Methylation
    }
    Bismark --> SeqMonk
    state SeqMonk {
     direction LR
    Analysis_Methylation --> QC
    QC --> Methylation_signal
    }
    SeqMonk --> DMR :Compare_between_groups
```
