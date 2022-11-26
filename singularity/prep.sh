#!/bin/bash
. /opt/miniconda3/bin/activate vox2cortex
cd /v2c/vox2cortex
. $FREESURFER_HOME/SetUpFreeSurfer.sh
#https://github.com/wandb/wandb/issues/592
export WANDB_MODE=offline
python scripts/pre_process_oasis.py
