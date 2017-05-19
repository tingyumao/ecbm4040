#!/bin/bash

echo "########################"
echo "# CUDNN Setup #"
echo "########################"
echo ""
echo "Remember to put cudnn package(cudnn-8.0-linux-x64-v5.1.solitairetheme8)"
echo "and cudnn_setup.sh in the same folder"

# Save script's current directory
DIR=$(pwd)

# /bin/bash
#set -e
#set -u
#set -x

# NVIDIA CUDNN v5.1

## step 1 unpack cudnn package
tar -xvf cudnn-8.0-linux-x64-v5.1.solitairetheme8

## step 2 move cudnn.h to /usr/local/cuda-8.0/include/
sudo cp ./cuda/include/cudnn.h /usr/local/cuda-8.0/include/ 

## step 3 move lib files to /usr/local/cuda-8.0/lib64/
sudo cp ./cuda/lib64/* /usr/local/cuda-8.0/lib64/ 

## step 4 remove intermediate files
rm -rf ./cuda

cd $DIR
