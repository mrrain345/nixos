{
  imports = [
    ./nvidia.nix
    ./pipewire.nix
    ./gnome.nix
    ./docker.nix
  ];

  config.modules = {
    nvidia = {
      enable = true;
      sync-mode = false;
    };
    pipewire.enable = true;
    gnome.enable = true;
    docker = {
      enable = true;
      nvidia = true;
    };
  };
}
