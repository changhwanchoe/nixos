# Starting Guide
1. sudo -i
2. nmtui or nmcli
3. git clone https://github.com/changhwanchoe/nixos.git
4. rm nixos/README.md
5. nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount nixos/disko.nix
6. mkdir -p /mnt/etc/nixos
7. mv nixos/* /mnt/etc/nixos
8. nixos-install --flake /mnt/etc/nixos#nixos
9. umount -l -R /mnt
10. reboot

### Boot list delete
1. efibootmgr
2. efibootmgr -b XXXX -B

### Check impermanence
1. journalctl -b -0 -u impermanence
