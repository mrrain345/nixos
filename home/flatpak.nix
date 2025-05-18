{inputs, ...}: {
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  services.flatpak.packages = [
    "org.gnome.World.PikaBackup"
    "com.obsproject.Studio"
  ];
}
