#!/bin/bash

LOGFILE="data/logs/setup_times.log"
echo "==== [Docker Benchmark] $(date) ====" >> "$LOGFILE"

# --- STEP 1: Check/install Docker (Linux only) ---
if ! command -v docker &> /dev/null; then
    echo "Installing Docker..." | tee -a "$LOGFILE"
    { time (
        sudo apt update -qq &&
        sudo apt install -y -qq apt-transport-https ca-certificates curl gnupg lsb-release &&
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg &&
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
          | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null &&
        sudo apt update -qq &&
        sudo apt install -y -qq docker-ce docker-ce-cli containerd.io
    ); } 2>> "$LOGFILE"
else
    echo "Docker already installed." | tee -a "$LOGFILE"
fi

# --- STEP 2: Start Docker (WSL-safe) ---
echo "Checking Docker availability..." | tee -a "$LOGFILE"
if ! docker version &>/dev/null; then
    echo "Docker not running. Attempting to start Docker Desktop from WSL..." | tee -a "$LOGFILE"
    { time powershell.exe -Command "Start-Process 'Docker Desktop' -Verb RunAs" > /dev/null; } 2>> "$LOGFILE"
    echo "Waiting for Docker to become available..." | tee -a "$LOGFILE"
    until docker version &> /dev/null; do
        sleep 1
        echo -n "." >> "$LOGFILE"
    done
    echo "Docker is now running." | tee -a "$LOGFILE"
else
    echo "Docker is already running." | tee -a "$LOGFILE"
fi

# --- STEP 3: Build Docker image (suppress normal output) ---
echo "Building Docker image..." | tee -a "$LOGFILE"
{ time docker build -t sort-benchmark -f environments/docker/Dockerfile . > /dev/null 2>&1; } 2>> "$LOGFILE"

# --- STEP 4: Run benchmark container ---
echo "Running benchmark in Docker..." | tee -a "$LOGFILE"
{ /usr/bin/time -v docker run --rm -v "$(pwd)/data/charts:/app/data/charts" sort-benchmark; } 2>> "$LOGFILE"
