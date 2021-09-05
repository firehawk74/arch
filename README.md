##### W tym repozytorium znajdziesz pakiety-skrypty dla podstawowej instalacji Arch Linux oraz środowisk graficznych Gnome, Deepin, KDE, Cinnamon, Xfce i i3 . Skrypt do instalacji podstawowej na MBR lub GPT. Pamiętaj, że pierwsza część instalacji Arch Linux jest ręczna, to znaczy będziesz musiał podzielić dysk na partycję , sformatować i zamontować dysk. Zainstaluj pakiet git. Do zainstalowania gita z repozytorium gitowego wymagany jest wcześniej zainstalowany git.

##### Małe podsumowanie:

##### Odśwież serwery i zainstaluj git - pacman -Sy git
##### Dzielenie dysku na partycję
##### Formatowanie partycji
##### Zamontuj partycje
##### Zainstaluj pakiety podstawowe w /mnt (pacstrap /mnt base linux linux-firmware git vim intel-ucode (lub amd-ucode))
##### Wygeneruj plik FSTAB za pomocą genfstab -U /mnt >> /mnt/etc/FSTAB
##### Chroot w z arch-chroot /mnt
##### Pobierz repozytorium git z https://gitlab.com/enemysmasher/arch.git klonowania git

##### cd arch
##### chmod +x install-uefi.sh
##### uruchom za pomocą bash 
