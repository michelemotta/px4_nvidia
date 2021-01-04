FROM px4io/px4-dev-simulation-focal:latest
MAINTAINER github/mmotta

RUN apt-get update && \
    apt-get install -y mesa-utils \
    binutils kmod

ADD NVIDIA-DRIVER.run /tmp/NVIDIA-DRIVER.run
RUN sh /tmp/NVIDIA-DRIVER.run -a -N --ui=none --no-kernel-module
RUN rm /tmp/NVIDIA-DRIVER.run

ENV NVIDIA_VISIBLE_DEVICES all
