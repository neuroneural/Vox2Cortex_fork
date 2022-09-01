singularity exec --nv --bind $FREESURFER_HOME:/fshome/,/data/users2/washbee/Vox2Cortex_fork/:/v2c,/data/users2/washbee/hcp-plis-subj:/hcp-plis-subj /data/users2/washbee/containers/v2c2.sif /v2c/singularity/train.sh

