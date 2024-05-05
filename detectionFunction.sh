#!/bin/bash
#SBATCH -J CaliforniaScrubJayDetection       # name of my job
#SBATCH -p share         # name of partition/queue to use. Share partition shall be sufficient 
#SBATCH -o CaliforniaScrubJayDetection.out        # name of output file for batch script
#SBATCH -e CaliforniaScrubJayDetection.err        # name of error file for batch script 
#SBATCH -n 1             # number of tasks
#SBATCH -c 2            # number of cores per task
#SBATCH --time=0-01:00:00  # time needed for job DD-HH:MM:SS; Here we ask for: 0 days, 1hour, 0 min, 0 second
#SBATCH --mem=10g        # memory needed for job; "g" means gigabytes. Here we ask for 10 gigabytes of memory

# gather basic information, can be useful for troubleshooting
hostname
echo $SLURM_JOBID

# load modules needed for job
module load R/4.2.2

# run my job
date

# run R code, print output to file "CaliforniaScrubJayDetection.out"
Rscript detectionFunction.R > CaliforniaScrubJayDetection.out

sleep 100
date

exit

