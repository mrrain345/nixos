{
  imports = [
    ./programs
    ./packages.nix
    ./fonts.nix
    ./flatpak.nix
    ./hyprland
  ];

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;

  home = {
    username = "mrrain";
    homeDirectory = "/home/mrrain";
    stateVersion = "24.11";
    sessionPath = ["/home/mrrain/.local/bin"];
  };
}
