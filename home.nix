{
  config,
  pkgs,
  ...
}: {
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
      monospace = ["Fira Code"];
    };
  };

  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    fira-code

    nh
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nano";
    NH_FLAKE = "/home/mrrain/Documents/nixos";
  };

  programs.home-manager.enable = true;
}
