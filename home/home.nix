{pkgs, ...}: {
  imports = [
    ./env.nix
    ./programs
    ./packages.nix
    ./flatpak.nix
    ./hyprland
  ];

  home = {
    username = "mrrain";
    homeDirectory = "/home/mrrain";
    stateVersion = "24.11";
    sessionPath = ["/home/mrrain/.local/bin"];
  };

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;
  home.packages = [pkgs.font-awesome];
}
