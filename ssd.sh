echo Example: sda

read -p '/dev/' hardDrivevar

fdisk /dev/$hardDrivevar << EOF
g
n
p
1

+550M
n
p
2

+11.9G
n
p
82
3

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
mkfs.ext4 -L dane /dev/sdb1

mount /dev/sda2 /mnt
mkdir /mnt/home
mount /dev/sdb1 /mnt/home
