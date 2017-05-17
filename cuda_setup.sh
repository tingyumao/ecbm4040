#!/bin/bash

echo "########################"
echo "# CUDA and CUDNN Setup #"
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

echo ""
echo "###################################################"
echo "Go to the NVIDIA website and download CUDA + CUDNN"
echo "https://developer.nvidia.com/cuda-toolkit"
echo "https://developer.nvidia.com/cudnn"
echo "and put it in ~/Downloads"
echo "the new .deb versions are recommended on ubuntu"
echo "Also open /usr/local/cuda/include/host_config.h"
echo "and comment out the following line with two backslashes //"
echo "#error -- unsupported GNU version! gcc versions later than 5.3 are not supported!"
echo ""
echo "IMPORTANT:"
echo "You may need to install the latest graphics driver first"
echo "CUDA must be installed with no graphics running"
echo "to disable graphics (from terminal):"
echo "sudo service lightdm stop"
echo "###################################################"
echo ""

# NVIDIA CUDA
sudo apt install -y linux-headers-$(uname -r)

if [ ! -d ~/Downloads/]
then
  mkdir ~/Downloads/
fi

if [ ! -f ~/Downloads/cuda-repo-ubuntu1604-8-0-local_8.0.44-1_amd64.deb ]
then
  curl https://developer.nvidia.com/compute/cuda/8.0/rc/local_installers/cuda-repo-ubuntu1604-8-0-local_8.0.44-1_amd64.deb --output ~/Downloads/cuda-repo-ubuntu1604-8-0-rc_8.0.27-1_amd64.deb
fi

# Note that if you are having problems with these steps, manually
# check the repository in the ubuntu software center:
# https://askubuntu.com/questions/650692/installing-cuda-7-0-on-ubuntu-14-04


# You will have to add the file to your software list. After running:

# sudo dpkg -i cuda-repo-ubuntu1404-7-0-local_7.0-28_amd64.deb
# open Softwares & Updates (search for it in the Dash)

# In the Other Software tab, enable the checkbox corresponding to your package. It will be of the form

# file:///var/cuda...

sudo dpkg -i ~/Downloads/cuda-repo-ubuntu1604-8-0-local_8.0.44-1_amd64.deb
sudo apt update
sudo apt install -y cuda


sh cudnn.sh

cd $DIR
