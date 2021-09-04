#!/bin/bash

echo Example: sda

read -p '/dev/' hardDrivevar

fdisk /dev/$hardDrivevar << EOF
g
n
1

+550M
n
2


t
1
1
t
2
20
t
3
19

w
EOF


mkfs.vfat -F32 -n EFI /dev/sda1
mkfs.ext4 -L root /dev/sda2
mkswap -L swap /dev/sda3


mount /dev/sda2 /mnt
swapon /dev/sda3


