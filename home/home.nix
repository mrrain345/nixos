{
  imports = [
    ./programs
    ./packages.nix
    ./fonts.nix
    ./flatpak.nix
  ];

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;

  home = {
    username = "mrrain";
    homeDirectory = "/home/mrrain";
    stateVersion = "24.11";
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  home.sessionPath = [
    "/home/mrrain/.local/bin"
  ];
}
