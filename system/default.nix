{
  imports = [
    ./hardware
    ./services
  ];

  modules = {
    nvidia.sync-mode = false;
    gnome.enable = false;
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "24.11";
}
