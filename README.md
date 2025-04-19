---

# Truss Optimization and Visualization Tool

This repository provides a powerful toolset for optimizing and visualizing structural truss designs using multiple weighted objectives such as mass, connectivity degree, symmetry, and beam continuity. The tool loads engineering data from Excel files, applies masking logic, performs optimization trials, and generates insightful plots.

---

## 📂 Project Structure

```bash
.
├── data/                      # Folder containing input Excel and JSON files
│   ├── MY_data.xlsx           # Structural and mass data
│   └── weights_4.json         # Weights for optimization
├── plots/                     # Output folder for generated visualizations and data
├── optimization.py            # Core optimization algorithm
├── plots.py                   # Functions for saving and creating visualizations
└── main.py                    # Main script to run the optimization and visualization
```

---

## 🚀 Getting Started

### Prerequisites

- Python 3.8+
- Install dependencies:

```bash
pip install -r requirements.txt
```

### Input Files

Place your input files in the `data/` directory:
- `.xlsx` file with sheets:
  - `Element U.C.`
  - `Element Mass`
  - `Element # NODE_1`, `Element # NODE_2`
  - `Element # NODE_1 coord.`, `Element # NODE_2 coord.`
- `.json` file containing a matrix of weights:
```json
{
  "weights": [[...], [...], ...]
}
```

---

## 🧪 Usage

Run the main script from the command line:

```bash
python main.py \
  --file_name MY_data \
  --experiment_name test \
  --weights_name weights_4 \
  --n_trials 100 \
  --is_title \
  --is_validation
```

### Arguments

| Argument         | Type     | Description                                                        |
|------------------|----------|--------------------------------------------------------------------|
| `--file_name`     | `str`    | Name of the Excel file (without extension) in `data/`             |
| `--experiment_name` | `str`  | Name for the experiment (used to name output folders/files)       |
| `--weights_name`  | `str`    | JSON file name (without extension) containing weight matrix        |
| `--n_trials`      | `int`    | Number of trials per optimization run                             |
| `--is_title`      | `flag`   | Show plot titles if passed                                        |
| `--is_validation` | `flag`   | Generate additional validation plots if passed                    |

---

## 📈 Output

All results and plots are saved to the `plots/{experiment_name}/` folder:

---

## ⚙️ Main Features

- **Data Preparation**: Automatically masks irrelevant elements based on usage conditions.
- **Multi-objective Optimization**: Performs structured trials based on defined weight configurations.
- **Visual Reporting**: Creates detailed and stacked plots for easy comparison.
- **Extensibility**: Modular codebase allows for easy customization of objectives and constraints.

---
