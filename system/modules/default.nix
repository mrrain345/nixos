{
  imports = [
    ./nvidia.nix
    ./pipewire.nix
    ./gnome.nix
    ./docker.nix
  ];

  config = {
    modules = {
      nvidia = {
        enable = true;
        sync-mode = false;
      };
      pipewire.enable = true;
      gnome.enable = false;
      docker = {
        enable = true;
        nvidia = true;
      };
    };

    programs.hyprland.enable = true;
  };
}
