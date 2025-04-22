# Comparing Runtimes of Merge Sort Across Environments

This project benchmarks the performance and setup time of **Merge Sort** and **Insertion Sort** across three environments:
- Native (bare system without venv)
- Docker container
- Virtual Machine (using local venv)

---

## TL;DR: How to Run Everything

### 1. Clone the repo and cd in
```bash
git clone git@github.com:your-team/Comparing_Runtimes.git
cd Comparing_Runtimes
```
### 2. Run all benchmarks
```bash

bash analysis/resource_trace.sh native
bash analysis/resource_trace.sh vm
bash analysis/resource_trace.sh docker

```
### 3. Generate Charts
python3 analysis/compare_environments.py
python3 analysis/parse_results.py

### 4. Project Structure
```
Comparing_Runtimes/
├── benchmark/                  # Benchmark script + sorting logic
│   └── sort_benchmark.py
├── analysis/                   # Timing scripts + log parser + visualizer
│   ├── docker_benchmark.sh
│   ├── native_benchmark.sh
│   ├── vm_benchmark.sh
│   ├── parse_timings.py
├── data/
│   ├── input/                  # rand1000.txt and rand1000000.txt
│   └── charts/                 # PNG chart outputs
├── environments/docker/        # Dockerfile and runtime env
├── report/                     # Final report (PDF)
├── presentation/               # Final presentation (PPTX)
└── README.md                   # This file
```

## What Gets Measured
Each script logs timing to analysis/setup_times.log:

- `real`: Wall-clock time

- `user`: CPU time in user-space

- `sys`: CPU time in kernel-space

These are then visualized in:

- data/charts/merge_comparison.png

- data/charts/merge_sort_env_timing_breakdown.png

## Dependencies (for visualizations and logging)

We recommend using a virtual environment for clean setup.

### Option 1: Using `venv` (Recommended)
```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```
Option 2: System-wide installation (use with caution)
```bash
pip3 install --break-system-packages matplotlib pandas psrecord
```
## Contributors
Cassius Kemp
Matthew Kenner
Ray Khan
Paul Kim