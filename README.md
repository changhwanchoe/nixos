# Starting Guide
1. sudo -i
2. nmtui
3. sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount --flake github:changhwanchoe/nixos#disko
4. sudo nixos-install --flake github:changhwanchoe/nixos#nixos --no-write-lock-file
5. sudo umount -l -R /mnt
6. reboot
