#!/bin/bash

echo Example: sda

read -p '/dev/' hardDrivevar

fdisk /dev/$hardDrivevar << EOF
g
n
1

+550M
t
1
n
1

+43.9G
n
p
2

+11.9G
n
1


w
q
EOF


echo Example: sdb

read -p '/dev/' hardDrivevar

fdisk /dev/$hardDrivevar << EOF
g
n
1


w
q
EOF


mkfs.vfat -F32 -n EFI /dev/sda1
mkfs.ext4 -L root /dev/sda2
mkswap -L swap /dev/sda3
mkfs.ext4 -L dane /dev/sdb1

mount /dev/sda2 /mnt
swapon /dev/sda3
mkdir /mnt/home
mount /dev/sdb1 /mnt/home


