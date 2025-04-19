#!/bin/bash

# Variables
experiment_name="exp_1"
is_validation=true  # or false
weights_name=weights_4

# Arrays
n_trials_arr=(50 200 350 500 1000 1500 2000)
#file_names=("MY_data_2" "MY_data_4" "MY_data_5" "MY_data_6")
file_names=("MY_data_2")

# Loop over each file_name and n_trials combination
for file_name in "${file_names[@]}"; do
  for n_trials in "${n_trials_arr[@]}"; do
    # Compose job name and script file name
    job_name="${experiment_name}_${file_name}_${n_trials}_${is_validation}"
    script_name="jobs/${job_name}.sh"

    # Start writing the .sh file
    {
      echo "#!/bin/sh"
      echo ""
      echo "#SBATCH --job-name=\"$job_name\""
      echo "#SBATCH --partition=compute"
      echo "#SBATCH --time=24:00:00"
      echo "#SBATCH --ntasks=1"
      echo "#SBATCH --cpus-per-task=1"
      echo "#SBATCH --mem-per-cpu=3967MB"
      echo "#SBATCH --account=education-ceg-msc-ce"
      echo ""
      echo "module load 2024r1"
      echo "module load openmpi"
      echo "module load python"
      echo "module load py-numpy"
      echo "module load cmake"
      echo "module load py-scipy"
      echo "module load py-matplotlib"
      echo "module load py-scikit-learn"
      echo ""
      cmd="srun python main.py --file_name $file_name --experiment_name $experiment_name --weights_name $weights_name --n_trials $n_trials"
      if [ "$is_validation" = true ]; then
        cmd="$cmd --is_validation"
      fi
      echo "$cmd"
    } > "$script_name"

    chmod +x "$script_name"
    echo "Generated: $script_name"
  done
done
