#!/bin/bash

export KO_DIR=/home/ssrclab1/Documents/seL4/inter-vm-data-transfer-protocol
export MY_DIR=/home/ssrclab1/Documents/seL4/intervm_manifest_17feb/projects/camkes-vm-images/rpi4

mkdir output
cp rootfs.cpio.gz output
gzip -d output/rootfs.cpio.gz
cd $MY_DIR/output
cpio -idv < rootfs.cpio
cp $KO_DIR/mymodule0.ko $MY_DIR/output
cp $KO_DIR/mymodule1.ko $MY_DIR/output
rm -r rootfs.cpio
find . -print -depth | cpio -ov > rootfs.cpio
gzip rootfs.cpio
mv rootfs.cpio.gz $MY_DIR
chmod 777 $MY_DIR/output/etc/sudoers
cd $MY_DIR
rm -r $MY_DIR/output
