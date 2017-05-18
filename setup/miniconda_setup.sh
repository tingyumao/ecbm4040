#!/bin/bash

echo "########################"
echo "# miniconda Setup #"
echo "########################"
echo ""
echo "install tensorflow jupyter etc"
echo ""

# Save script's current directory
DIR=$(pwd)

# /bin/bash
#set -e
#set -u
#set -x

# NVIDIA CUDNN v5.1

## step 0 download&install miniconda
#wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
#bash Miniconda2-latest-Linux-x86_64.sh
#rm Miniconda2-latest-Linux-x86_64.sh

#source ~/.bashrc

## step 1 install tensorflow-gpu
#conda create -n tensorflow
#source activate tensorflow
#pip install https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-1.1.0-cp27-none-linux_x86_64.whl

## step 2 install jupyter
#source activate tensorflow
#conda install jupyter


cd $DIR
