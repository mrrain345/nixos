{
  imports = [
    ./hardware
    ./services
  ];

  settings = {
    nvidia.sync-mode = true;
    gnome.enable = false;
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "24.11";
}
