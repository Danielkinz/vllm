#!/bin/bash

# Change version format: xx.y.z -> xx-y
CUDA_VERSION=$(python -c "print('-'.join('$1'.split('.')[:2]))")
# Removes '-' and '.' ex: ubuntu-18.04 -> ubuntu1804
OS=$(echo $2 | tr -d ".\-")

# Installs CUDA
wget -nv https://developer.download.nvidia.com/compute/cuda/repos/${OS}/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
rm cuda-keyring_1.1-1_all.deb
sudo apt -qq update
sudo apt -y install cuda-${CUDA_VERSION} cuda-nvcc-${CUDA_VERSION} cuda-libraries-dev-${CUDA_VERSION}
sudo apt clean
