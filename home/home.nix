{
  imports = [
    ./hyprland
    ./programs
    ./env.nix
    ./flatpak.nix
  ];

  home = {
    username = "mrrain";
    homeDirectory = "/home/mrrain";
    stateVersion = "24.11";
    sessionPath = ["/home/mrrain/.local/bin"];
  };

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
