#!/bin/sh

IMAGE_NAME=px4_nvidia:000
NVIDIA_DRIVER=NVIDIA-Linux-x86_64-455.38.run  # path to nvidia driver

cp ${NVIDIA_DRIVER} NVIDIA-DRIVER.run
sudo docker build -t ${IMAGE_NAME} .
