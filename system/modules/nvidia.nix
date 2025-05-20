{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.nvidia;
in {
  options.modules.nvidia = {
    enable = lib.mkEnableOption "Enable nvidia drivers";
    sync-mode = lib.mkEnableOption "Switch offload mode to sync mode";
  };

  config = lib.mkIf cfg.enable {
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [nvidia-vaapi-driver];
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

    environment.systemPackages = with pkgs; [
      libva-utils
      vdpauinfo
      vulkan-tools
      vulkan-validation-layers
      libvdpau-va-gl
      egl-wayland
      wgpu-utils
      mesa
      libglvnd
      nvitop
      libGL
    ];
  };
}
