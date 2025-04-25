# Comparing Runtimes of Merge Sort Across Environments

This project benchmarks the performance and setup time of **Merge Sort** and **Insertion Sort** across three environments:
- Native (bare system without venv)
- Docker container
- Virtual Machine (using local venv)

---

## TL;DR: How to Run Everything

### 1. Clone the repo and cd in
```bash
git clone git@github.com:kennermatt-cmd/Comparing_Runtimes.git
cd Comparing_Runtimes
```
### 2. Run all benchmarks
```bash

bash analysis/resource_trace.sh native
bash analysis/resource_trace.sh vm
bash analysis/resource_trace.sh docker

```
### 3. Generate Charts
```
python3 analysis/compare_environments.py
python3 analysis/parse_results.py
```
## Project Structure
```
Comparing_Runtimes/
├── CONTRIBUTING.md
├── README.md
├── analysis                            # Timing scripts + log parser + visualizers
│   ├── compare_environments.py
│   ├── compare_insertions.py
│   ├── docker_benchmark.sh
│   ├── native_benchmark.sh
│   ├── parse_timings.py
│   ├── resource_trace.sh
│   └── vm_benchmark.sh
├── benchmark                           # Benchmark script + sorting logic
│   └── sort_benchmark.py
├── data
│   ├── charts                          # PNG chart outputs
│   │   ├── docker_usage.png
│   │   ├── native_usage.png
│   │   ├── sort_comparison_docker.png
│   │   ├── sort_comparison_native.png
│   │   ├── sort_comparison_vm.png
│   │   └── vm_usage.png
│   ├── input                           # rand1000.txt and rand1000000.txt input files
│   │   ├── rand1000.txt
│   │   └── rand1000000.txt
│   └── logs                            # logs of usage
│       ├── docker_ps.log
│       ├── native_ps.log
│       ├── resource_trace.log
│       ├── setup_times.log
│       └── vm_ps.log
├── environments                        # Dockerfile and runtime env
│   ├── docker
│   │   └── Dockerfile
│   └── vm
├── presentation                        # Final presentation (PPTX)
│   └── final_slides.pptx
├── report                              # Final report (PDF)
│   └── project_report.pdf
└── requirements.txt
```

## What Gets Measured
Each script logs OS resources and timing to analysis/setup_times.log.
Below is a list of prominent statistics:

| Descriptor | Description | Importance |
|--------|--------|---------|
| user | CPU time in user-space | Pure CPU cost without OS I/O delays |
| sys | CPU time in kernel-space | Higher sys = heavier overhead |
| % CPU used | How effeciently environment used available CPU | Low CPU % = environment overhead|
| Elapsed time | Wall-clock time | Real time to complete a task |
| Maximum resident set size | Peak memory usage in KB | Memory Efficiency |
| Major page faults | Times it had to fetch missing memory from disk. | Higher #s = slower VRAM handling |
| File system I/O | File system inputs/outputs | Checks for slow disk ops |
| Context Switches | Process is yielding CPU to other processes | Multitasking responsiveness |


These are then visualized in:

- data/charts/sort_comparison.png

- data/charts/env_timing_breakdown.png

## Dependencies (for visualizations and logging)

We recommend using a virtual environment for clean setup.

### Option 1: Using `venv` (Recommended)
```bash
cd environments/vm/
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