#!/bin/bash
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --mem=100g
#SBATCH -p qTRDGPUH
#SBATCH --gres=gpu:V100:1
#SBATCH -t 5-00:00
#SBATCH -J v2ctrain
#SBATCH -e jobs/error%A.err
#SBATCH -o jobs/out%A.out
#SBATCH -A psy53c17
#SBATCH --mail-type=ALL
#SBATCH --mail-user=washbee1@student.gsu.edu
#SBATCH --oversubscribe

sleep 5s
source /usr/share/lmod/lmod/init/bash
module use /application/ubuntumodules/localmodules
module load singularity/3.10.2
singularity exec --nv --bind /data/users2/washbee/speedrun/Vox2Cortex_fork/:/v2c,/data/users2/washbee/speedrun/v2c-data:/hcp-plis-subj /data/users2/washbee/containers/speedrun/v2c_sr.sif /v2c/singularity/train.sh &
wait

