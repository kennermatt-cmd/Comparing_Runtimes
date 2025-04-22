#!/bin/bash

LOGFILE="data/logs/setup_times.log"
echo "==== [VM Benchmark] $(date) ====" >> "$LOGFILE"

echo "Installing pip3 and venv in VM..." | tee -a "$LOGFILE"
{ time sudo apt update && sudo apt install -y python3-pip python3-venv; } 2>> "$LOGFILE"

echo "Creating virtual environment..." | tee -a "$LOGFILE"
{ time python3 -m venv venv; } 2>> "$LOGFILE"

echo "Installing matplotlib in venv..." | tee -a "$LOGFILE"
{ time venv/bin/pip install matplotlib; } 2>> "$LOGFILE"

echo "Running benchmark in VM using venv..." | tee -a "$LOGFILE"
{ /usr/bin/time -v venv/bin/python benchmark/sort_benchmark.py vm; } 2>> "$LOGFILE"
