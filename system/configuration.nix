{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./locale.nix
    ./user.nix
    ./modules
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  hardware.enableAllFirmware = true;
  services.flatpak.enable = true;

  programs.hyprland.enable = true;

  services.gnome.gnome-keyring.enable = true;
  services.gnome.gnome-settings-daemon.enable = true;

  environment.systemPackages = with pkgs; [
    glib
  ];

  security.polkit.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk
  ];

  system.stateVersion = "24.11";
}
