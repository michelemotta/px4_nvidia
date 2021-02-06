FROM px4io/px4-dev-simulation-focal:2020-11-18
MAINTAINER github/mmotta

ARG USER=mm
ARG USERHOME=/home/mm
ARG QGC=https://s3-us-west-2.amazonaws.com/qgroundcontrol/latest/QGroundControl.AppImage
ARG NVIDIA=NVIDIA-Linux-x86_64-455.38.run

RUN apt-get update && \
    apt-get install -y mesa-utils \
    binutils kmod \
    fuse libpulse-mainloop-glib0 && \
    rm /etc/java-8-openjdk/accessibility.properties && \
    useradd -ms /bin/bash $USER && \
    usermod -a -G dialout $USER && \
    apt-get remove modemmanager -y

ADD $QGC $USERHOME

ADD $NVIDIA /tmp/NVIDIA-DRIVER.run
RUN sh /tmp/NVIDIA-DRIVER.run -a -N --ui=none --no-kernel-module
RUN rm /tmp/NVIDIA-DRIVER.run

ENV NVIDIA_VISIBLE_DEVICES all
