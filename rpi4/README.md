# Guest VM image building migrated to Yocto

The preferred way of building the guest kernel and the root filesystem is to
use the meta-sel4 Yocto layer. But if you are outside the TII organization or
do not want to setup Yocto, you can do it the old way.

See https://github.com/tiiuae/tii_sel4_build/#rebuilding-guest-vm-components
on how to use Yocto.

## Build instructions
### Linux image

*TODO: add exact Linux revision*

For sake of clarity, we assume ${LINUX\_SOURCES} points to Linux kernel source
tree and ${SEL4\_PROJECT} points to the project source tree.

    cd ${LINUX_SOURCES}
    mkdir build
    cd build
    cp ${SEL4_PROJECT}/camkes-vm-images/rpi4/linux-configs/config .config
    export ARCH=arm64
    export CROSS_COMPILE=aarch64-none-linux-gnu-
    make olddefconfig
    make
    cp arch/arm64/boot/Image ${SEL4_PROJECTS}/projects/camkes-vm-images/rpi4/linux

In case you modified kernel config, remember to update the config in git as well:

    make savedefconfig
    cp defconfig ${SEL4_PROJECTS}/projects/camkes-vm-images/rpi4/linux-config

### Buildroot rootfs

*TODO: add exact Buildroot revision*

For sake of clarity, we assume ${BUILDROOT\_SOURCES} points to Buildroot source
tree and ${SEL4\_PROJECT} points to the project source tree.

    cd ${BUILDROOT_SOURCES}
    cp ${SEL4_PROJECT}/camkes-vm-images/rpi4/buildroot/buildroot-config config
    make defconfig BR2_DEFCONFIG=./config
    make all
    cp output/images/rootfs.cpio.gz ${SEL4_PROJECTS}/projects/camkes-vm-images/rpi4/rootfs.cpio.gz
