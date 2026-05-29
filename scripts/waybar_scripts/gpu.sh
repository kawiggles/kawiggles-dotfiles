#!/bin/bash
# ~/.config/waybar/scripts/gpu.sh

GPU0_UTIL=$(nvidia-smi -i 0 --query-gpu=utilization.gpu --format=csv,noheader,nounits)
GPU1_UTIL=$(nvidia-smi -i 1 --query-gpu=utilization.gpu --format=csv,noheader,nounits)
GPU0_TEMP=$(nvidia-smi -i 0 --query-gpu=temperature.gpu --format=csv,noheader,nounits)
GPU1_TEMP=$(nvidia-smi -i 1 --query-gpu=temperature.gpu --format=csv,noheader,nounits)

echo "GPU 1: ${GPU0_UTIL}% ${GPU0_TEMP}°C | GPU 2: ${GPU1_UTIL}% ${GPU1_TEMP}°C"
