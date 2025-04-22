#!/bin/bash

echo "🐳 [Docker] Building container..." | tee -a analysis/setup_times.log
{ time docker build -t sort-benchmark environments/docker/; } 2>> analysis/setup_times.log

echo "🚀 [Docker] Running container..." | tee -a analysis/setup_times.log
{ time docker run --rm sort-benchmark; } 2>> analysis/setup_times.log
