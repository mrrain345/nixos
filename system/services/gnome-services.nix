{pkgs, ...}: {
  services.gnome.gnome-keyring.enable = true;
  services.gnome.gnome-settings-daemon.enable = true;
  services.gvfs.enable = true;
  programs.dconf.enable = true;

  services.dbus.packages = with pkgs; [
    gnome-settings-daemon
    dbus-glib
    libsecret
    gcr
  ];
}
