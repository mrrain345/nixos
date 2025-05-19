{...}: {
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

  system.stateVersion = "24.11";
}
