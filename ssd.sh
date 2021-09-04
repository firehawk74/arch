#!/bin/bash

echo Example: sda

read -p '/dev/' hardDrivevar

fdisk /dev/$hardDrivevar << EOF
g               # create new GPT partition
n               # add new partition
1               # partition number
                # default - first sector 
+550M           # partition size
t               # change partition type
1               # partition number
n               # add new partition
2               # partition number


+44G           # partition size
t               # change partition type
1               # partition number
20              # Linux filesystem
n               # add new partition
3               # partition number


#t               # change partition type
#2               # partition number
#20              # Linux filesystem
#t               # change partition type
#3               # partition number
#19              # Linux filesystem

w
EOF


mkfs.vfat -F32 -n EFI /dev/sda1
mkfs.ext4 -L root /dev/sda2
#mkswap -L swap /dev/sda3
#mkfs.ext4 -L dane /dev/sda3


mount /dev/sda2 /mnt
#swapon /dev/sda3
#mkdir /mnt/home 
#mount /dev/sda3 /mnt/dane

