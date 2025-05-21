{pkgs, ...}: {
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };

  environment.systemPackages = [pkgs.docker-buildx];
  hardware.nvidia-container-toolkit.enable = true;
}
