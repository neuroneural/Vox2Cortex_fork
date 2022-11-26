#!/bin/bash
#SBATCH -n 1
#SBATCH -c 20
#SBATCH --mem=200g
#SBATCH -p qTRDGPUH
#SBATCH -t 5-00:00
#SBATCH --gres=gpu:V100:1
#SBATCH -J v2cprep
#SBATCH -e /data/users2/washbee/Vox2Cortex_fork/jobs/error%A.err
#SBATCH -o /data/users2/washbee/Vox2Cortex_fork/jobs/out%A.out
#SBATCH -A psy53c17
#SBATCH --mail-type=ALL
#SBATCH --mail-user=washbee1@student.gsu.edu
#SBATCH --oversubscribe
#SBATCH --exclude=arctrdgn002,arctrddgx001

sleep 5s
module load singularity/3.10.2
singularity exec --nv --bind /data,/home,/data/users2/washbee/speedrun/Vox2Cortex_fork/:/v2c,/data/users2/washbee/hcp-plis-subj:/hcp-plis-subj /data/users2/washbee/containers/speedrun/v2c_sr.sif /v2c/singularity/prep.sh &
wait

