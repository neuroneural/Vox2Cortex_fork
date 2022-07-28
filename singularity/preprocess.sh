#!/bin/bash
. /opt/miniconda3/bin/activate vox2cortex
. /fshome/SetUpFreeSurfer.sh
python /v2c/vox2cortex/scripts/pre_process_oasis.py
