#! /bin/bash

DATASET_PATH=/scratch/gpfs/blou/Colgate/Polar6
EXPERIMENT_NAME=polar6
ITERATIONS=10000

module purge
module load anaconda3/2022.5
conda activate torchngp

# python scripts/colmap2nerf.py --video $DATASET_PATH/video.mp4 --video_fps 10 --run_colmap --out $DATASET_PATH/

# mkdir -p data/$EXPERIMENT_NAME

python main_nerf.py $DATASET_PATH --fp16 --preload --workspace=data/$EXPERIMENT_NAME/ --bound 1.0 --dt_gamma 0.02 --iters $ITERATIONS

# python scripts/utils.py --operation gen_cam_path --datadir $DATASET_PATH

# # normal render
# python scripts/run.py --mode nerf --scene $DATASET_PATH --load_snapshot data/$EXPERIMENT_NAME/weights.msgpack --video_output data/$EXPERIMENT_NAME/video.mp4 --video_camera_path $DATASET_PATH/base_cam.json --video_n_seconds 5 --video_fps 30 --width 640 --height 480

# # depth map render
# python scripts/run.py --mode nerf --render_depth=True --exposure=-4 --scene $DATASET_PATH --load_snapshot data/$EXPERIMENT_NAME/weights.msgpack --video_output data/$EXPERIMENT_NAME/depth.mp4 --video_camera_path $DATASET_PATH/base_cam.json --video_n_seconds 5 --video_fps 30 --width 640 --height 480

# # python scripts/run.py --mode nerf --scene $DATASET_PATH --load_snapshot data/$EXPERIMENT_NAME/weights.msgpack --save_mesh data/$EXPERIMENT_NAME/model.obj --marching_cubes_res 256