{pkgs, ...}: {
  imports = [
    ./flatpak.nix
  ];

  home = {
    username = "mrrain";
    homeDirectory = "/home/mrrain";
    stateVersion = "24.11";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };

  programs.git = {
    enable = true;
    userName = "MrRaiN";
    userEmail = "mc.rain345@gmail.com";
  };

  fonts = {
    fontconfig.enable = true;
    fontconfig.defaultFonts = {
      sansSerif = ["Noto Sans"];
      serif = ["Noto Serif"];
      emoji = ["Noto Color Emoji"];
      monospace = ["Fira Code"];
    };
  };

  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    fira-code

    nh
  ];

  home.sessionVariables = {
    EDITOR = "nano";
    FLAKE = "/home/mrrain/Documents/nixos";
    NH_FLAKE = "/home/mrrain/Documents/nixos";
  };

  programs.home-manager.enable = true;
}
