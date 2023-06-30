#!/bin/bash
. /opt/miniconda3/bin/activate vox2cortex
cd /v2c/vox2cortex
#. /fshome/SetUpFreeSurfer.sh
#https://github.com/wandb/wandb/issues/592
export WANDB_MODE=offline
python main.py --test --dataset=DATASET_NAME -n hcp
