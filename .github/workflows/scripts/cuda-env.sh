#!/bin/bash

CUDA_VERSION=$1

export CUDA_HOME=/usr/local/cuda-${CUDA_VERSION}
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:${LD_LIBRARY_PATH}
export PATH=${CUDA_HOME}/bin:${PATH}
