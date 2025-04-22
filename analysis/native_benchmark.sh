#!/bin/bash

echo "==== [Native Benchmark - No venv] $(date) ====" >> analysis/setup_times.log

echo "📦 [Native] Installing dependencies globally..." | tee -a analysis/setup_times.log
{ time pip3 install --user -r benchmark/requirements.txt; } 2>> analysis/setup_times.log

echo "🚀 [Native] Running benchmark..." | tee -a analysis/setup_times.log
{ time python3 benchmark/sort_benchmark.py; } 2>> analysis/setup_times.log
