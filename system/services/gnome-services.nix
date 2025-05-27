{pkgs, ...}: {
  services.gnome.gnome-keyring.enable = true;
  services.gnome.gnome-settings-daemon.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;
  services.gvfs.enable = true;
  programs.dconf.enable = true;

  services.dbus.packages = [pkgs.dbus-glib];
  services.udev.packages = [pkgs.gnome-settings-daemon];

  environment.systemPackages = with pkgs; [
    gnome-keyring
    libsecret
  ];
}
