#!/bin/bash
#SBATCH -n 1
#SBATCH -c 54
#SBATCH --mem=200g
#SBATCH -p qCPU48
#SBATCH --nodelist=acidscn006
#SBATCH -t 0-22:00
#SBATCH -J v2cprep
#SBATCH -e /data/users2/washbee/Vox2Cortex_fork/jobs/error%A.err
#SBATCH -o /data/users2/washbee/Vox2Cortex_fork/jobs/out%A.out
#SBATCH -A psy53c17
#SBATCH --mail-type=ALL
#SBATCH --mail-user=washbee1@student.gsu.edu
#SBATCH --oversubscribe

sleep 5s

singularity exec --bind $FREESURFER_HOME:/fshome/,/data/users2/washbee/Vox2Cortex_fork/:/v2c,/data/users2/washbee/hcp-plis-subj/:/hcp-plis-subj/ /data/users2/washbee/containers/v2c.sif /v2c/singularity/preprocess.sh &

wait

sleep 10s
~                                                                                                                                                                                                                  
~                                  
