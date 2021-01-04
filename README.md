# README

The repo is my succesfull tentative to run OpenGL graphics using NVIDIA graphic card inside a docker container.

I tried different approaches, but the one that is working is described in https://github.com/gklingler/docker3d

Steps to do:
1. Download the NVIDIA-*.run that it is running on your system (it must be exactly the same version)
2. Change the base image according to your needs in Dockerfile (I was using for px4io/px4-dev-simulation-focal)
3. Run build.sh to build the image
4. Run the image with run.sh

My laptop has the following configuration:

~~~
$ lspci | egrep "VGA|3D"
00:02.0 VGA compatible controller: Intel Corporation 4th Gen Core Processor Integrated Graphics Controller (rev 06)
03:00.0 3D controller: NVIDIA Corporation GM108M [GeForce 840M] (rev a2)

$ sudo lshw -c video
  *-display
       description: 3D controller
       product: GM108M [GeForce 840M]
       vendor: NVIDIA Corporation
       physical id: 0
       bus info: pci@0000:03:00.0
       version: a2
       width: 64 bits
       clock: 33MHz
       capabilities: pm msi pciexpress bus_master cap_list rom
       configuration: driver=nvidia latency=0
       resources: irq:41 memory:f6000000-f6ffffff memory:e0000000-efffffff memory:f0000000-f1ffffff ioport:e000(size=128) memory:f7000000-f707ffff
  *-display
       description: VGA compatible controller
       product: 4th Gen Core Processor Integrated Graphics Controller
       vendor: Intel Corporation
       physical id: 2
       bus info: pci@0000:00:02.0
       version: 06
       width: 64 bits
       clock: 33MHz
       capabilities: msi pm vga_controller bus_master cap_list rom
       configuration: driver=i915 latency=0
       resources: irq:38 memory:f7400000-f77fffff memory:d0000000-dfffffff ioport:f000(size=64) memory:c0000-dffff
~~~

