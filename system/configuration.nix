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
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  # environment.systemPackages = with pkgs; [
  #   git
  #   nixd
  #   nil
  #   nixfmt-rfc-style
  #   alejandra
  #   vscode.fhs
  # ];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "24.11";
}
