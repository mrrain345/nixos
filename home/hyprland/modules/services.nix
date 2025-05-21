{pkgs, ...}: {
  services.network-manager-applet.enable = true;
  services.blueman-applet.enable = true;
  services.gnome-keyring.enable = true;

  home.packages = with pkgs; [
    hyprpolkitagent
    networkmanagerapplet
  ];
}
