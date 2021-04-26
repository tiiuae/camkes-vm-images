# rpi4
## Compilation details:
### Linux image
* File: linux
* From: https://github.com/torvalds/linux.git
* Commit hash: d4961772226de3b48a395a26c076d450d7044c76
* Config: `linux-config`

### Buildroot Rootfs image
* File: rootfs.cpio.gz
* From: git://git.buildroot.net/buildroot
* Commit hash: 75fa35e1ea787094fed53b9f6f89b11116b32408
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
