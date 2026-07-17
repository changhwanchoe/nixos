{
  environment.persistence."/persistent" = {
    enable = true;
    hideMounts = true;
    directories = [
      # "/var/log"
      # "/var/lib/bluetooth"
      "/var/lib/nixos" # necessary
      "/etc/nixos" # necessary
      "/var/lib/systemd/timers"
      "/var/lib/systemd/backlight"
      # "/var/lib/systemd/coredump"
      # { directory = "/var/lib/colord"; user = "colord"; group = "colord"; mode = "u=rwx,g=rx,o="; }
    ];
    files = [
      "/etc/machine-id"
      # { file = "/var/keys/secret_file"; parentDirectory = { mode = "u=rwx,g=,o="; }; }
    ];
    users.cch = {
      directories = [
        "Downloads"
        # "Music"
        # "Pictures"
        "Documents"
        ".emacs.d"
        ".config"
        ".pi"
        ".local/state/wireplumber"
        # "Videos"
        # "VirtualBox VMs"
        # { directory = ".gnupg"; mode = "0700"; }
        # { directory = ".ssh"; mode = "0700"; }
        # { directory = ".nixops"; mode = "0700"; }
        # { directory = ".local/share/keyrings"; mode = "0700"; }
        # ".local/share/direnv"
      ];
      files = [
        # ".screenrc"
      ];
    };
  };
}
