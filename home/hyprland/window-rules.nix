{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "float, class:Signal"

      "float, class:com.obsproject.Studio"
      "persistentsize, class:com.obsproject.Studio"

      "bordercolor rgb(${config.lib.stylix.colors.base09}), fullscreen:1"
    ];
  };
}
