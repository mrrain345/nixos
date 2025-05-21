{
  imports = [
    ./modules
    ./binds.nix
    ./monitors.nix
    ./settings.nix
  ];

  wayland.windowManager.hyprland.enable = true;
  programs.waybar.enable = true;

  settings.hyprland.monitors = {
    primary = {
      name = "HDMI-A-4";
      resolution = "1920x1080";
      refresh_rate = 60;
      offset = "0x0";
      scale = 1;
    };

    secondary = {
      name = "eDP-1";
      resolution = "1920x1080";
      refresh_rate = 144;
      offset = "1920x0";
      scale = 1;
    };
  };

  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "waybar"
      "systemctl --user start hyprpolkitagent"
    ];
  };
}
