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
  services.fwupd.enable = true;

  services.flatpak.enable = true;
  programs.hyprland.enable = true;

  services.gnome.gnome-keyring.enable = true;
  services.gnome.gnome-settings-daemon.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.gvfs.enable = true;

  programs.dconf.enable = true;

  services.dbus.packages = with pkgs; [
    dbus-glib
    libsecret
    gcr
    gnome-settings-daemon
  ];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  environment.systemPackages = with pkgs; [
    glib
  ];

  security.polkit.enable = true;

  system.stateVersion = "24.11";
}
