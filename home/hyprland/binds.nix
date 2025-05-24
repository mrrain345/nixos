{config, ...}: let
  monitors = config.settings.hyprland.monitors;
in {
  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER, Return, exec, uwsm app -T"
      "SUPER, B, exec, uwsm app -- com.google.Chrome"
      "SUPER, V, exec, uwsm app -- code"
      "SUPER, F, exec, uwsm app -- nautilus"
      "SUPER, M, exec, uwsm app -- org.signal.Signal"
      "SUPER, K, exec, uwsm app -- gnome-calculator"
      "SUPER, T, exec, uwsm app -- gnome-text-editor"
      "SUPER, A, exec, uwsm app -- \"$(wofi --show drun --define=drun-print_desktop_file=true | sed -E \"s/(\.desktop) /\1:/\")\""

      "SUPER, left, movefocus, l"
      "SUPER, right, movefocus, r"
      "SUPER, up, movefocus, u"
      "SUPER, down, movefocus, d"

      "SUPER SHIFT, left, movewindow, l"
      "SUPER SHIFT, right, movewindow, r"
      "SUPER SHIFT, up, movewindow, u"
      "SUPER SHIFT, down, movewindow, d"

      "SUPER CTRL SHIFT, left, movetoworkspace, r-1"
      "SUPER CTRL SHIFT, right, movetoworkspace, r+1"

      "SUPER, TAB, layoutmsg, swapwithmaster"
      "SUPER SHIFT, TAB, swapactiveworkspaces, ${monitors.primary.name} ${monitors.secondary.name}"

      "SUPER, X, killactive"
      "SUPER, slash, togglefloating"
      "SUPER, F11, fullscreen, 1"
      ", F11, fullscreen, 0"

      "SUPER CTRL, left, workspace, r-1"
      "SUPER CTRL, right, workspace, r+1"

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

      "SUPER CTRL, 1, movetoworkspace, 1"
      "SUPER CTRL, 2, movetoworkspace, 2"
      "SUPER CTRL, 3, movetoworkspace, 3"
      "SUPER CTRL, 4, movetoworkspace, 4"
      "SUPER CTRL, 5, movetoworkspace, 5"
      "SUPER CTRL, 6, movetoworkspace, 6"
      "SUPER CTRL, 7, movetoworkspace, 7"
      "SUPER CTRL, 8, movetoworkspace, 8"
      "SUPER CTRL, 9, movetoworkspace, 9"
      "SUPER CTRL, 0, movetoworkspace, 10"
    ];

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
      "ALT, mouse:272, resizewindow"
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
