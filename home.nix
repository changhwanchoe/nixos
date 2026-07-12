{ pkgs, ... }:

{
  home.username = "cch";
  home.homeDirectory = "/home/cch";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    fd
    ripgrep
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "cch";
        email = "chl01991@naver.com";
      };
    };
  };

  programs.qutebrowser = {
    enable = true;
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-nox;
    extraPackages = epkgs: with epkgs; [
      evil
      evil-collection
      magit
    ];
  };

  programs.kitty.font.size = "10";

  home.sessionVariables = {
    EDITOR = "emacs";
  };
}
