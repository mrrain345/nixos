{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.modules.gnome;
in {
  options.modules.gnome = {
    enable = lib.mkEnableOption "Enable GNOME support";
  };

  config = lib.mkIf cfg.enable {
    services.xserver.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
    services.xserver.displayManager.gdm.enable = true;

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

    environment.systemPackages = with pkgs; [
      gnomeExtensions.dash-to-dock
    ];
  };
}
