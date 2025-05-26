{
  config,
  lib,
  ...
}: let
  monitors = config.settings.hyprland.monitors;
  color = base: lib.mkForce "rgb(${config.lib.stylix.colors.${base}})";
in {
  wayland.windowManager.hyprland.settings = {
    cursor = {
      no_hardware_cursors = 1;
      default_monitor = monitors.primary.name;
    };

    input = {
      kb_layout = "pl";
    };

    general."col.inactive_border" = color "base02";
    group."col.border_inactive" = color "base02";
    group.groupbar."col.inactive" = color "base02";

    general = {
      border_size = 2;
      gaps_in = 6;
      gaps_out = 12;
      layout = "master";
      resize_on_border = true;
      snap.enabled = true;
    };

    master = {
      mfact = 0.67;
    };

    decoration = {
      rounding = 12;
      dim_inactive = true;
      dim_strength = 0.3;
    };

    misc = {
      disable_splash_rendering = true;
      animate_manual_resizes = true;
    };

    binds = {
      drag_threshold = 10;
    };
  };
}
