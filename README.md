#### W tym repozytorium znajdziesz pakiety-skrypty dla podstawowej instalacji Arch Linux oraz środowisk graficznych Gnome, KDE, Cinnamon, Xfce i i3 . Więcej informacji na temat Menedżerów systemu Windows wkrótce. Zmodyfikuj pakiety według własnych upodobań, spraw, aby skrypt był wykonywalny za pomocą chmod +x scriptname, a następnie uruchom z ./scriptname. Skrypt do instalacji podstawowej na MBR/Legacy będzie dostępny wkrótce. Pamiętaj, że pierwsza część instalacji Arch Linux jest ręczna, to znaczy będziesz musiał samodzielnie podzielić, sformatować i zamontować dysk. Zainstaluj pakiety podstawowe i upewnij się, że zawierasz git, abyś mógł sklonować repozytorium w chroot.

Małe podsumowanie:

W razie potrzeby załaduj mapę
Odśwież serwery pacmanem -Syy
Dzielenie dysku na partycje
Formatowanie partycji
Zamontuj partycje
Zainstaluj pakiety podstawowe w /mnt (pacstrap /mnt base linux linux-firmware git vim intel-ucode (lub amd-ucode))
Wygeneruj plik FSTAB za pomocą genfstab -U /mnt >> /mnt/etc/FSTAB
Chroot w z arch-chroot /mnt
Pobierz repozytorium git z https://gitlab.com/eflinux/arch-basic klonowania git

cd arch-basic
chmod +x install-uefi.sh
uruchom za pomocą ./install-uefi.sh
