#!/bin/bash

LOGFILE="data/logs/setup_times.log"
echo "==== [Native Benchmark - No venv] $(date) ====" >> "$LOGFILE"

echo "Installing pip3 (system-wide)..." | tee -a "$LOGFILE"
{ /usr/bin/time -v sudo apt update -qq && sudo apt install -y -qq python3-pip; } 2>> "$LOGFILE"

echo "Installing matplotlib using --break-system-packages..." | tee -a "$LOGFILE"
{ /usr/bin/time -v pip3 install --break-system-packages matplotlib; } 2>> "$LOGFILE"

echo "Running benchmark (native)..." | tee -a "$LOGFILE"
{ /usr/bin/time -v python3 benchmark/sort_benchmark.py native; } 2>> "$LOGFILE"
