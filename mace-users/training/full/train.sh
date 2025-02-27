#!/bin/bash

gpu_id=1
CUDA_VISIBLE_DEVICES="$gpu_id" python /u/vld/sedm6197/miniconda3/envs/mace_uff/lib/python3.9/site-packages/mace/cli/run_train.py \
  --name="MACE" \
  --foundation_model="small" \
  --train_file="train-full.xyz" \
  --valid_fraction=0.10 \
  --test_file="test-full.xyz" \
  --energy_weight=1.0 \
  --forces_weight=1.0 \
  --E0s="average" \
  --loss='huber' \
  --lr=0.01 \
  --scaling="rms_forces_scaling" \
  --batch_size=30 \
  --max_num_epochs=200 \
  --swa \
  --default_dtype='float32' \
  --energy_key='QM_energy' \
  --forces_key='QM_forces' \
  --stress_weight=0 \
  --stress_key=None \
  --start_swa=100 \
  --swa_energy_weight=1000 \
  --swa_forces_weight=100 \
  --lr=0.001 \
  --ema \
  --ema_decay=0.99 \
  --amsgrad \
  --restart_latest \
  --device=cuda \
  --seed=123 \