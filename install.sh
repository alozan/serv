#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

#Install dependencies
sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 wget

#Install Python
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev
wget https://www.python.org/ftp/python/3.11.0/Python-3.11.0.tgz
tar -xf Python-3.10.*.tgz
cd Python-3.10.*/
./configure --enable-optimizations
make -j 4
sudo make altinstall
python3 --version

#Install Nano
sudo apt install nano

#Install requirements.txt
pip install requirements.txt

#Install nvidia drivers
sudo ubuntu-drivers install --gpgpu

#Install cuda
wget https://developer.download.nvidia.com/compute/cuda/repos/<distro>/<arch>/cuda-archive-keyring.gpg
sudo mv cuda-archive-keyring.gpg /usr/share/keyrings/cuda-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/cuda-archive-keyring.gpg] https://developer.download.nvidia.com/compute/cuda/repos/<distro>/<arch>/ /" | sudo tee /etc/apt/sources.list.d/cuda-<distro>-<arch>.list

wget https://developer.download.nvidia.com/compute/cuda/repos/<distro>/<arch>/cuda-<distro>.pin
sudo mv cuda-<distro>.pin /etc/apt/preferences.d/cuda-repository-pin-600

sudo apt-get update

sudo apt-get install cuda

sudo apt-get install nvidia-gds

