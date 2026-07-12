# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
  programs.sway.enable = true;
  environment.etc."sway/config".text = let
    oriConfig = builtins.readFile "${config.programs.sway.package}/etc/sway/config";
    modifiedConfig1 = builtins.replaceStrings ["set $mod Mod4"] ["set $mod Mod4\ninput * xkb_options caps:escape\ninput type:touchpad events disabled\ndefault_border pixel 1\ndefault_floating_border pixel 1"] oriConfig;
    modifiedConfig2 = builtins.replaceStrings ["bindsym $mod+Left focus left"] [""] modifiedConfig1;
    modifiedConfig3 = builtins.replaceStrings ["bindsym $mod+Right focus right"] [""] modifiedConfig2;
    modifiedConfig4 = builtins.replaceStrings ["bindsym $mod+Up focus up"] [""] modifiedConfig3;
    modifiedConfig5 = builtins.replaceStrings ["bindsym $mod+Down focus down"] [""] modifiedConfig4;

    modifiedConfig6 = builtins.replaceStrings ["bindsym $mod+Shift+Left move left"] [""] modifiedConfig5;
    modifiedConfig7 = builtins.replaceStrings ["bindsym $mod+Shift+Right move right"] [""] modifiedConfig6;
    modifiedConfig8 = builtins.replaceStrings ["bindsym $mod+Shift+Up move up"] [""] modifiedConfig7;
    modifiedConfig9 = builtins.replaceStrings ["bindsym $mod+Shift+Down move down"] [""] modifiedConfig8;

    modifiedConfig10 = builtins.replaceStrings ["bindsym Left resize shrink width 10px"] [""] modifiedConfig9;
    modifiedConfig11 = builtins.replaceStrings ["bindsym Right resize grow width 10px"] [""] modifiedConfig10;
    modifiedConfig12 = builtins.replaceStrings ["bindsym Up resize shrink height 10px"] [""] modifiedConfig11;
    modifiedConfig13 = builtins.replaceStrings ["bindsym Down resize grow height 10px"] [""] modifiedConfig12;
  in
    modifiedConfig13;
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.nameservers = [ "8.8.8.8" "1.1.1.1" ];

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Seoul";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [ fcitx5-hangul ];
  };
  i18n.inputMethod.fcitx5.settings.inputMethod = {
    GroupOrder."0" = "Default";
    "Group/0" = {
      Name = "Default";
      "Default Layout" = "us";
      DefaultIM = "keyboard-us";
    };
    "Groups/0/Items/0".Name = "keyboard-us";
    "Groups/0/Items/1".Name = "hangul";
  };
  i18n.inputMethod.fcitx5.settings.globalOptions = {
    "Hotkey/TriggerKeys"."0" = "SHIFT_SPACE";
  };
  i18n.inputMethod.fcitx5.waylandFrontend = true;
  i18n.inputMethod.fcitx5.ignoreUserConfig = true;
  services.xserver.desktopManager.runXdgAutostartIfNone = true;
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;


  

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.root.initialPassword = "a";
  users.users.cch = {
    isNormalUser = true;
    initialPassword = "a";
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
  #   packages = with pkgs; [
  #     tree
  #   ];
  };

  # programs.firefox.enable = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   wget
    tlp
  ];

  services.tlp = {
    enable = true;
    settings = {
      START_CHARGE_THRESH_BAT0 = "78";
      STOP_CHARGE_THRESH_BAT0 = "80";
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}

