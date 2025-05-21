{pkgs, ...}: {
  home.pointerCursor.gtk.enable = true;
  qt.enable = true;

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };
}
