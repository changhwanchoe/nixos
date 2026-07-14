# Starting Guide
1. sudo -i
2. nmtui or nmcli
3. git clone https://github.com/changhwanchoe/nixos.git
4. nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount nixos/disko.nix
5. mv nixos/* /mnt/persistent
6. nixos-install --flake /mnt/persistent#nixos
7. umount -l -R /mnt
8. reboot

### Boot list delete
1. efibootmgr
2. efibootmgr -b XXXX -B

### Check impermanence
1. journalctl -b -0 -u impermanence
