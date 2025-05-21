{config, ...}: let
  monitors = config.settings.hyprland.monitors;
in {
  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER, Return, exec, alacritty"
      "SUPER, B, exec, com.google.Chrome"
      "SUPER, V, exec, code"
      "SUPER, F, exec, nautilus"
      "SUPER, M, exec, org.signal.Signal"
      "SUPER, K, exec, gnome-calculator"
      "SUPER, T, exec, gnome-text-editor"
      "SUPER, A, exec, wofi"

      "SUPER, left, movefocus, l"
      "SUPER, right, movefocus, r"
      "SUPER, up, movefocus, u"
      "SUPER, down, movefocus, d"

      "SUPER SHIFT, left, swapwindow, l"
      "SUPER SHIFT, right, swapwindow, r"
      "SUPER SHIFT, up, swapwindow, u"
      "SUPER SHIFT, down, swapwindow, d"

      "SUPER, TAB, layoutmsg, swapwithmaster"
      "SUPER SHIFT, TAB, swapactiveworkspaces, ${monitors.primary.name} ${monitors.secondary.name}"

      "SUPER, Q, killactive"
      "SUPER, slash, togglefloating"
      "SUPER, F11, fullscreen, 1"
      ", F11, fullscreen, 0"

      "CTRL ALT, left, workspace, r-1"
      "CTRL ALT, right, workspace, r+1"

      "SUPER, 1, workspace, 1"
      "SUPER, 2, workspace, 2"
      "SUPER, 3, workspace, 3"
      "SUPER, 4, workspace, 4"
      "SUPER, 5, workspace, 5"
      "SUPER, 6, workspace, 6"
      "SUPER, 7, workspace, 7"
      "SUPER, 8, workspace, 8"
      "SUPER, 9, workspace, 9"
      "SUPER, 0, workspace, 10"

      "SUPER SHIFT, 1, movetoworkspace, 1"
      "SUPER SHIFT, 2, movetoworkspace, 2"
      "SUPER SHIFT, 3, movetoworkspace, 3"
      "SUPER SHIFT, 4, movetoworkspace, 4"
      "SUPER SHIFT, 5, movetoworkspace, 5"
      "SUPER SHIFT, 6, movetoworkspace, 6"
      "SUPER SHIFT, 7, movetoworkspace, 7"
      "SUPER SHIFT, 8, movetoworkspace, 8"
      "SUPER SHIFT, 9, movetoworkspace, 9"
      "SUPER SHIFT, 0, movetoworkspace, 10"
    ];

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];

    bindc = [
      "SUPER, mouse:272, togglefloating"
    ];

    bindl = [
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      "SUPER, F9, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      "SUPER, F12, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ];

    bindle = [
      ", XF86AudioLowerVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%+"
      "SUPER, F10, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%-"
      "SUPER, F11, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%+"
    ];
  };
}
