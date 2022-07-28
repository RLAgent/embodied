#!/bin/bash

TASK=$1

for i in 0 1 2 3; do
	LOGDIR="/home/lslee_google_com/logdir/${TASK}/$(date +%Y%m%d-%H%M%S)-$i"

	mkdir -p $LOGDIR

	CUDA_VISIBLE_DEVICES=$i python3 train.py \
	  --logdir $LOGDIR \
	  --configs dmc_proprio --task ${TASK} 2>&1 > $LOGDIR/out.txt &
done

