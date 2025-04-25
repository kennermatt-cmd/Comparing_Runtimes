#!/bin/bash

mkdir -p data/charts
mkdir -p data/logs

TARGET=$1
INTERVAL=0.1
TRACE_LOG="data/logs/resource_trace.log"

echo "==== [Resource Trace - $(date)] for $TARGET ====" >> "$TRACE_LOG"

case $TARGET in 
  (native)
    echo "Recording Native Benchmark..." | tee -a "$TRACE_LOG"
    mkdir -p data/charts data/logs
    venv_ps/bin/psrecord "bash analysis/native_benchmark.sh" \
      --include-children \
      --plot "$(pwd)/data/charts/native_usage.png" \
      --interval "$INTERVAL" \
      --log data/logs/native_ps.log
    ;;
  (vm)
    echo "Recording VM Benchmark..." | tee -a "$TRACE_LOG"
    mkdir -p data/charts data/logs
    venv_ps/bin/psrecord "bash analysis/vm_benchmark.sh" \
      --include-children \
      --plot "$(pwd)/data/charts/vm_usage.png" \
      --interval $INTERVAL \
      --log data/logs/vm_ps.log
    ;;
  (docker)
    echo "Recording Docker Benchmark..." | tee -a "$TRACE_LOG"
    mkdir -p data/charts data/logs
    venv_ps/bin/psrecord "bash analysis/docker_benchmark.sh" \
    --include-children \
    --plot "$(pwd)/data/charts/docker_usage.png" \
    --interval $INTERVAL \
    --log data/logs/docker_ps.log
    ;;
esac
