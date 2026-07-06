{ pkgs, ... }:

{
  home.username = "cch";
  home.homeDirectory = "/home/cch";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    fd
    ripgrep
  ];

  programs.git = {
    enable = true;
  };

  programs.qutebrowser = {
    enable = true;
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-nox;
  };

  home.sessionVariables = {
    EDITOR = "emacs";
  };
}
