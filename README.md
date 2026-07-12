# Starting Guide
1. sudo -i
2. nmtui
3. git clone https://github.com/changhwanchoe/nixos.git
4. nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount nixos/disko.nix
5. mkdir -p /mnt/etc/nixos
6. mv nixos/* /mnt/etc/nixos/
7. nixos-install --flake github:changhwanchoe/nixos#nixos
8. umount -l -R /mnt
9. reboot

### Boot list delete
1. efibootmgr
2. efibootmgr -b XXXX -B

### Check impermanence
1. journalctl -b -0 -u impermanence
