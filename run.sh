#!/bin/sh

COMMAND=/bin/bash

xhost + # allow connections to X server

# Run docker and open bash shell                       
docker run -it --rm --privileged \
	--env=LOCAL_USER_ID="$(id -u)" \
	-v ~/PX4/src/PX4-Autopilot:/src/PX4-Autopilot/:rw \
	-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
	--runtime=nvidia \
	-e NVIDIA_VISIBLE_DEVICES=all \
	-e DISPLAY=:1 \
	--gpus all \
	-p 14570:14570/udp \
	--name=my_PX4_nvidia px4_nvidia:000 $COMMAND

