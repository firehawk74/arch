#!/bin/bash

DYSK=/dev/sda

#rozmiary partycji w MiB
PART_EFI=512       #512 MiB
PART_ROOT=38147    #40 GiB
PART_SWAP=9216     #~8 GiB


echo "label: gpt
device: ${sda}
unit: sectors

${sda}1 : size=${512}MiB, type=C12A7328-F81F-11D2-BA4B-00A0C93EC93B
${sda}2 : size=${38147}MiB, type=0FC63DAF-8483-4772-8E79-3D69D8477DE4
${sda}3 : size=${9216}MiB, type=0657FD6D-A4AB-43C4-84E5-0933C84B4F4F
" | sfdisk ${DYSK}



mkfs.vfat -F32 -n EFI /dev/sda1
mkfs.ext4 -L root /dev/sda2
mkswap -L swap /dev/sda3


mount /dev/sda2 /mnt
swapon /dev/sda3



