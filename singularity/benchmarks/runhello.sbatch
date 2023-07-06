#!/bin/bash
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --mem=40g
#SBATCH -p qTRDGPU
#SBATCH --gres=gpu:RTX:1
#SBATCH -t 1-00:00
#SBATCH -J v2ctest
#SBATCH -e jobs/error%A.err
#SBATCH -o jobs/out%A.out
#SBATCH -A psy53c17
#SBATCH --mail-type=ALL
#SBATCH --mail-user=washbee1@student.gsu.edu
#SBATCH --oversubscribe
#SBATCH --exclude=arctrdgn002,arctrddgx001

sleep 5s
source /usr/share/lmod/lmod/init/bash
module use /application/ubuntumodules/localmodules
module load singularity/3.10.2
singularity exec --nv --bind /data,/data/users2/washbee/speedrun/Vox2Cortex_fork/:/v2c, /data/users2/washbee/containers/speedrun/v2c_bm_sandbox/ /v2c/singularity/benchmarks/helloworld.sh &
wait

