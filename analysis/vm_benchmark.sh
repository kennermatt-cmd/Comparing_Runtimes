#!/bin/bash

echo "🧮 [VM] Installing dependencies and running benchmark..." | tee -a analysis/setup_times.log
{ time pip3 install --user -r benchmark/requirements.txt; } 2>> analysis/setup_times.log
{ time python3 benchmark/sort_benchmark.py; } 2>> analysis/setup_times.log
