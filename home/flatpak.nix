{inputs, ...}: {
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  services.flatpak.packages = [
    "com.google.Chrome"
    "com.obsproject.Studio"
    "org.signal.Signal"
    "com.discordapp.Discord"

    "com.belmoussaoui.Authenticator"
    "org.gnome.World.PikaBackup"
    "io.gitlab.theevilskeleton.Upscaler"
    "org.nickvision.tubeconverter"
    "com.github.tchx84.Flatseal"
    "app.drey.EarTag"
    "io.missioncenter.MissionCenter"

    "org.gimp.GIMP"
    "com.mojang.Minecraft"

    "io.bassi.Amberol"
    "io.github.celluloid_player.Celluloid"
    "org.gnome.Calendar"
    "org.gnome.Evince"
    "org.gnome.Loupe"
    "org.gnome.Snapshot"
  ];

  home.file = {
    ".local/share/applications/com.obsproject.Studio.desktop" = {
      source = ./files/com.obsproject.Studio.desktop;
    };
  };
}
