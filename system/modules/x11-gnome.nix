{
  lib,
  config,
  ...
}: let
  cfg = config.modules.x11-gnome;
in {
  options.modules.x11-gnome = {
    enable = lib.mkEnableOption "Enable GNOME X11 support";
  };

  config = lib.mkIf cfg.enable {
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
    services.xserver.xkb = {
      layout = "pl";
      variant = "";
    };
  };
}
