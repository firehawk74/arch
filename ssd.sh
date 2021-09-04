#!/bin/bash

echo Example: sda

read -p '/dev/' hardDrivevar

fdisk /dev/$hardDrivevar << EOF
g  # create a new empty GPT partition table
n  # new partition
1  # partition number 1

+550M # 550 MB boot parttion
t  # change a partition type
1  
n  # new partition
2  # partion number 2

+43.9G # 43.9G  root
t  # change a partition type
20  
n  # new partition
3  # partion number 3

+11.9G # 11.9G  swap
t  # change a partition type
19 
n  # new partition
3  # partion number 3

w
q
EOF


mkfs.vfat -F32 -n EFI /dev/sda1
mkfs.ext4 -L root /dev/sda2
mkswap -L swap /dev/sda3


mount /dev/sda2 /mnt
swapon /dev/sda3



