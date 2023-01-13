#! /bin/bash

module purge
module load anaconda3/2022.5
conda activate torchngp

python raymarching/setup.py build_ext --inplace
