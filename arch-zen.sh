#!/bin/bash
loadkeys pl
setfont Lat2-Terminus16
timedatectl set-ntp true

pacstrap -i /mnt base base-devel bash-completion linux-zen linux-zen-headers linux-firmware nano dhcpcd neofetch

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt/

