# rpi4
## Compilation details:
### Linux image
* File: linux
* From: https://github.com/raspberrypi/linux
* Commit hash: 3e55254ce6f792372bbfe90f77006e75467c1dfe (rpi-5.10.y)
* Config: `linux-config`

### Buildroot Rootfs image
* File: rootfs.cpio.gz
* From: git://git.buildroot.net/buildroot
* Commit hash: e2fba6457bd9d9c720540332eaf0c1f8c29eab00 (2021.02)
* Config: `buildroot/buildroot-config`

## Build instructions
### Linux image

For sake of clarity, we assume ${LINUX\_SOURCES} points to Linux kernel source
tree and ${SEL4\_PROJECT} points to the project source tree.

    cd ${LINUX_SOURCES}
    mkdir build
    cd build
    cp ${SEL4_PROJECT}/camkes-vm-images/rpi4/linux-config .config
    export ARCH=arm64
    export CROSS_COMPILE=aarch64-none-linux-gnu-
    make olddefconfig
    make
    cp arch/arm64/boot/Image ${SEL4_PROJECTS}/projects/camkes-vm-images/rpi4/linux

In case you modified kernel config, remember to update the config in git as well:

    make savedefconfig
    cp defconfig ${SEL4_PROJECTS}/projects/camkes-vm-images/rpi4/linux-config
