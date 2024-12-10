#!/bin/bash

config_path=$1
train_output_path=$2
ckpt_name=$3


FLAGS_allocator_strategy=naive_best_fit \
FLAGS_fraction_of_gpu_memory_to_use=0.01 \
python3 ${BIN_DIR}/../../synthesize_e2e.py \
    --am=fastspeech2_csmsc \
    --am_config=${config_path} \
    --am_ckpt=fastspeech2_nosil_baker_ckpt_0.4/snapshot_iter_76000.pdz \
    --am_stat=dump/train/speech_stats.npy \
    --voc=pwgan_csmsc \
    --voc_config=pwg_baker_ckpt_0.4/pwg_default.yaml \
    --voc_ckpt=pwg_baker_ckpt_0.4/pwg_snapshot_iter_400000.pdz \
    --voc_stat=pwg_baker_ckpt_0.4/pwg_stats.npy \
    --lang=zh \
    --text=${BIN_DIR}/../../assets/sentences.txt \
    --output_dir=${train_output_path}/test_e2e \
    --phones_dict=fastspeech2_nosil_baker_ckpt_0.4//phone_id_map.txt \
    --inference_dir=${train_output_path}/inference