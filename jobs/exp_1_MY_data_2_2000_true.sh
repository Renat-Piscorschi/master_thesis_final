#!/bin/sh

#SBATCH --job-name="exp_1_MY_data_2_2000_true"
#SBATCH --partition=compute
#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=3967MB
#SBATCH --account=education-ceg-msc-ce

module load 2024r1
module load openmpi
module load python
module load py-numpy
module load cmake
module load py-scipy
module load py-matplotlib
module load py-scikit-learn

srun python main.py --file_name MY_data_2 --experiment_name exp_1 --weights_name weights_4 --n_trials 2000 --is_validation
