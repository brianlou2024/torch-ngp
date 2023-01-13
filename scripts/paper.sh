#! /bin/bash

DATASET_PATH=/scratch/gpfs/blou/Colgate/Paper_torch
EXPERIMENT_NAME=paper_torch
ITERATIONS=10000

module purge
module load anaconda3/2022.5
conda activate torchngp

# python scripts/colmap2nerf.py --video $DATASET_PATH/video.h264 --video_fps 10 --run_colmap --out $DATASET_PATH/
# python scripts/colmap2nerf.py --colmap_matcher=exhaustive --images $DATASET_PATH/images/ --run_colmap --out $DATASET_PATH/

# python scripts/colmap2nerf.py --colmap_matcher=exhaustive --images $DATASET_PATH/images/ --out $DATASET_PATH/
mkdir -p data/$EXPERIMENT_NAME
# python raymarching/setup.py build_ext --inplace
# python main_nerf.py $DATASET_PATH --fp16 --preload --workspace=data/$EXPERIMENT_NAME --iters $ITERATIONS
python main_nerf.py $DATASET_PATH --test --fp16 --preload --workspace=data/$EXPERIMENT_NAME --iters $ITERATIONS
