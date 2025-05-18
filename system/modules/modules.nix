{...}: {
  imports = [
    ./nvidia.nix
    ./pipewire.nix
    ./gnome.nix
  ];

  config.modules = {
    nvidia.enable = true;
    pipewire.enable = true;
    gnome.enable = true;
  };
}
