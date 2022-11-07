#!/bin/bash
#SBATCH -n 1
#SBATCH -c 5
#SBATCH --mem=64g
#SBATCH -p qTRDGPUH
#SBATCH --nodelist arctrddgx002
#SBATCH --gres=gpu:V100:1
#SBATCH -t 5-00:00
#SBATCH -J v2ctrain
#SBATCH -e /data/users2/washbee/Vox2Cortex_fork/jobs/error%A.err
#SBATCH -o /data/users2/washbee/Vox2Cortex_fork/jobs/out%A.out
#SBATCH -A psy53c17
#SBATCH --mail-type=ALL
#SBATCH --mail-user=washbee1@student.gsu.edu
#SBATCH --oversubscribe
#SBATCH --exclude=arctrdgn002

sleep 5s
module load singularity/3.10.2
singularity exec --nv --bind $FREESURFER_HOME:/fshome/,/data/users2/washbee/Vox2Cortex_fork/:/v2c,/data/users2/washbee/hcp-plis-subj-v2c:/hcp-plis-subj /data/users2/washbee/containers/v2csandbox.sif /v2c/singularity/train.sh &
wait

