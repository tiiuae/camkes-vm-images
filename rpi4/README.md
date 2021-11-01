# rpi4
## Compilation details:
### Linux image

Linux kernel sources are cloned during the TII git-repo setup and the actual revision
used is specified in <https://github.com/tiiuae/tii_sel4_manifest/blob/tii/development/default.xml>.

### Buildroot Rootfs image
* File: rootfs.cpio.gz
* From: git://git.buildroot.net/buildroot
* Commit hash: 6668381363364c89d43689322cc5ce4249c8fd9d (2021.02.1)
* Config: `buildroot/buildroot-config`

## Build instructions
### Linux image

Check out the instructions at <https://github.com/tiiuae/tii_sel4_build/#rebuilding-guest-linux-kernel>.

### Buildroot rootfs
For sake of clarity, we assume ${BUILDROOT\_SOURCES} points to Buildroot source
tree and ${SEL4\_PROJECT} points to the project source tree.

    cd ${BUILDROOT_SOURCES}
    cp ${SEL4_PROJECT}/camkes-vm-images/rpi4/buildroot/buildroot-config config
    make defconfig BR2_DEFCONFIG=./config
    make all
    cp output/images/rootfs.cpio.gz ${SEL4_PROJECTS}/projects/camkes-vm-images/rpi4/rootfs.cpio.gz
