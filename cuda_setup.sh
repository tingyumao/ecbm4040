#!/bin/bash

echo "########################"
echo "# CUDA Setup #"
echo "########################"
echo ""
echo "Manual steps are involved! you may need to update the"
echo "install paths and download some files yourse"

# Save script's current directory
DIR=$(pwd)

# /bin/bash
set -e
set -u
set -x

# NVIDIA CUDA

## step 2.1 install gcc
sudo apt-get install gcc

## step 2.2 install g++
sudo apt-get install g++

## step 2.3 install make
sudo apt-get install make

## step 2.4  install Correct Kernel Headers and Development Packages
sudo apt-get install linux-headers-$(uname -r)

## start cuda installation
if [ ! -d ~/Downloads/]; then
  mkdir ~/Downloads/
  echo "create ~/Downloads folder under home directory"
fi

cd ~/Downloads/

if [ ! -f ~/Downloads/cuda_8.0.61_375.26_linux-run ]; then
  wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run 
  echo "cuda toolkit file downloads DONE"
fi

#sudo sh cuda_8.0.61_375.26_linux-run

cd $DIR
