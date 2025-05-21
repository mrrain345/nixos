{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.nvidia;
in {
  options.modules.nvidia = {
    sync-mode = lib.mkEnableOption "Switch from offload mode to sync mode";
  };

  config = {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
        libva
        vaapiVdpau
        libvdpau-va-gl
        egl-wayland
        mesa
        libglvnd
        libGL
      ];
    };

    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia.open = true;
    hardware.nvidia.modesetting.enable = true;

    hardware.nvidia.prime = {
      sync.enable = cfg.sync-mode;
      offload = lib.mkIf (!cfg.sync-mode) {
        enable = true;
        enableOffloadCmd = true;
      };

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
