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
2


w
EOF


echo Example: sdb

read -p '/dev/' hardDrivevar

fdisk /dev/$hardDrivevar << EOF
g
n
1


w
EOF

dd if=/dev/zero of=/mnt/SWAP bs= 1M count=8192

mkfs.vfat -F32 -n EFI /dev/sda1
mkfs.ext4 -L root /dev/sda2
mkfs.ext4 -L dane /dev/sdb1

mkswap /mnt/SWAP
chmod 0600 /mnt/SWAP
swapon /mnt/SWAP

mount /dev/sda2 /mnt
mkdir /mnt/home
mount /dev/sdb1 /mnt/home
