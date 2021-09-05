#!/bin/bash

DYSK=/dev/sdx

#rozmiary partycji w MiB
PART_EFI=512       #512 MiB
PART_ROOT=43500    #43.5 GiB
PART_HOME=223570   #240 GiB
PART_SWAP=11900    #~12 GiB


echo "label: gpt
device: ${sda}
unit: sectors

${sda}1 : size=${512}MiB, type=C12A7328-F81F-11D2-BA4B-00A0C93EC93B
${sda}2 : size=${43500}MiB, type=0FC63DAF-8483-4772-8E79-3D69D8477DE4
${sda}3 : size=${11900}MiB, type=0657FD6D-A4AB-43C4-84E5-0933C84B4F4F
" | sfdisk ${sda}

echo "label: gpt
device: ${sdb}
unit: sectors

${sdb}1 : size=${223570}MiB, type=0FC63DAF-8483-4772-8E79-3D69D8477DE4
" | sfdisk ${sdb}


#typy partycji możesz sobie sprawdzić przy pomocy sfdisk -X gpt -T

#formatowanie standardowo przez mkfs


mkfs.vfat -F32 -n EFI /dev/sda1
mkfs.ext4 -L root /dev/sda2
mkfs.ext4 -L dane /dev/sdb1
mkswap -L swap /dev/sda3


mount /dev/sda2 /mnt
mkdir /mnt/home 
mount /dev/sdb1 /mnt/dane
swapon /dev/sda3

