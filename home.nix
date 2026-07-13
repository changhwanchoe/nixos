{ pkgs, ... }:

{
  home.username = "cch";
  home.homeDirectory = "/home/cch";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    fd
    ripgrep
    nodejs # for pi coding agent
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
    extraConfig = ''
      (use-package evil
        :init
        (setq evil-want-keybinding nil)
        :config
        (evil-mode 1))

      (use-package evil-collection
        :after evil
        :config
        (evil-collection-init))
    '';
  };

  home.sessionVariables = {
    EDITOR = "emacs";
  };
}
