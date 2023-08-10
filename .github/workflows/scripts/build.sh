#!/bin/bash

cuda_home=/usr/local/cuda-${{ matrix.cuda-version }}
python_executable=python${{ matrix.python-version }}

# Update paths
PATH=${cuda_home}/bin:$PATH
LD_LIBRARY_PATH=${cuda_home}/lib64:$LD_LIBRARY_PATH

# Install requirements
$python_executable -m pip install wheel packaging
$python_executable -m pip install -r requirements.txt

# Build
$python_executable setup.py bdist_wheel --dist-dir=dist

# Rename the wheel
version_suffix=cu${{ matrix.cuda-version }}
wheel_name=$(ls dist/*whl | xargs -n 1 basename | sed "s/-/-$version_suffix-/2")
ls dist/*whl | xargs -I {} mv {} ${wheel_name}

echo "wheel_name=${wheel_name}" >> $GITHUB_ENV