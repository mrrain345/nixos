{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.docker;
in {
  options.modules.docker = {
    enable = lib.mkEnableOption "Enable Docker support";
    nvidia = lib.mkEnableOption "Enable NVIDIA container toolkit";
  };

  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
      storageDriver = "btrfs";
    };

    environment.systemPackages = with pkgs; [
      docker-buildx
    ];

    hardware.nvidia-container-toolkit.enable = cfg.nvidia;
  };
}
