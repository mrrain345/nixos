{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.settings.gnome;
in {
  options.settings.gnome = {
    enable = lib.mkEnableOption "Enable GNOME desktop environment";
  };

  config = lib.mkIf cfg.enable {
    services.xserver.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
    services.xserver.displayManager.gdm.enable = true;

    environment.systemPackages = with pkgs; [
      gnomeExtensions.dash-to-dock
    ];
  };
}
