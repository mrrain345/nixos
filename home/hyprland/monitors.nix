{
  config,
  lib,
  ...
}: let
  cfg = config.settings.hyprland.monitors;
in {
  options.settings.hyprland.monitors = let
    monitor = label: {
      name = lib.mkOption {
        type = lib.types.str;
        default = "";
        example = "DP-1";
        description = "The ${label} monitor name.";
      };
      resolution = lib.mkOption {
        type = lib.types.str;
        default = "1920x1080";
        description = "The ${label} monitor resolution.";
      };
      refresh_rate = lib.mkOption {
        type = lib.types.number;
        default = 60;
        description = "The ${label} monitor refresh rate.";
      };
      offset = lib.mkOption {
        type = lib.types.str;
        default =
          if label == "primary"
          then "0x0"
          else "1920x0";
        description = "The ${label} monitor offset.";
      };
      scale = lib.mkOption {
        type = lib.types.number;
        default = 1;
        description = "The ${label} monitor scale.";
      };
    };
  in {
    primary = monitor "primary";
    secondary = monitor "secondary";
  };

  config = {
    wayland.windowManager.hyprland.settings = let
      m0 = cfg.primary;
      m1 = cfg.secondary;
    in {
      monitor = [
        # name, resolution@refresh_rate, offset, scale
        "${m0.name}, ${m0.resolution}@${toString m0.refresh_rate}, ${m0.offset}, ${toString m0.scale}"
        "${m1.name}, ${m1.resolution}@${toString m1.refresh_rate}, ${m1.offset}, ${toString m1.scale}"
      ];

      workspace = [
        "1, monitor:${m0.name}, default:true"
        "2, monitor:${m1.name}, default:true"
      ];
    };
  };
}
