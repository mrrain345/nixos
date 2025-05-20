{pkgs, ...}: {
  imports = [
    ./mako.nix
  ];

  wayland.windowManager.hyprland.enable = true;

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  programs.waybar.enable = true;
  services.network-manager-applet.enable = true;

  home.packages = with pkgs; [
    rofi-wayland
    hyprpolkitagent
    networkmanagerapplet
  ];

  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };

  qt.enable = true;

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    monitor = [
      "HDMI-A-4, 1920x1080@60, 0x0, 1"
      "eDP-1, 1920x1080@144, 1920x0, 1"
    ];

    workspace = [
      "1, monitor:HDMI-A-4, default:true"
      "2, monitor:eDP-1, default:true"
    ];

    cursor = {
      no_hardware_cursors = 1;
      default_monitor = "HDMI-A-4";
    };

    input = {
      kb_layout = "pl";
    };

    general = {
      border_size = 2;
      gaps_in = 6;
      gaps_out = 12;
      layout = "master";
      resize_on_border = true;
      snap.enabled = true;
    };

    decoration = {
      rounding = 12;
      dim_inactive = true;
      dim_strength = 0.3;
    };

    misc = {
      disable_splash_rendering = true;
      animate_manual_resizes = true;
      animate_mouse_windowdragging = false;
    };

    binds = {
      drag_threshold = 10;
    };

    bind =
      [
        "$mod, Return, exec, alacritty"
        "$mod, B, exec, com.google.Chrome"
        "$mod, V, exec, code"
        "$mod, F, exec, nautilus"
        "$mod, M, exec, org.signal.Signal"
        "$mod, K, exec, org.gnome.Calculator"
        "$mod, A, exec, rofi -show drun -show-icons"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        "$mod CTRL, left, swapwindow, l"
        "$mod CTRL, right, swapwindow, r"
        "$mod CTRL, up, swapwindow, u"
        "$mod CTRL, down, swapwindow, d"

        "$mod, Q, killactive"
        "$mod, slash, togglefloating"
        "$mod, F11, fullscreen, 1"
        ", F11, fullscreen, 0"
      ]
      ++ (
        # workspaces
        builtins.concatLists (builtins.genList (
            i: let
              ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod CTRL, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    bindc = [
      "$mod, mouse:272, togglefloating"
    ];

    # bindr = [
    #   "$mod, SUPER_L, exec, rofi -show drun -show-icons"
    # ];

    bindl = [
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      "$mod, F9, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      "$mod, F12, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ];

    bindle = [
      ", XF86AudioLowerVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%+"
      "$mod, F10, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%-"
      "$mod, F11, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%+"
    ];

    exec-once = [
      # "hyprctl dispatch workspace 1"
      "waybar"
      "systemctl --user start hyprpolkitagent"
    ];
  };
}
