{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./modules
    ./binds.nix
    ./monitors.nix
    ./settings.nix
  ];

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
      refresh_rate = 60;
      offset = "1920x0";
      scale = 1;
    };
  };

  home.packages = with pkgs; [
    inputs.ags-shell.packages.${pkgs.system}.default
    hyprnome
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "systemctl --user start hyprpolkitagent"
        "ags-shell"
      ];
    };
  };
}
