{pkgs, ...}: {
  imports = [
    ./mako.nix
  ];

  wayland.windowManager.hyprland.enable = true;
  services.network-manager-applet.enable = true;
  services.blueman-applet.enable = true;
  services.gnome-keyring.enable = true;
  programs.waybar.enable = true;

  programs.wofi = {
    enable = true;
    settings = {
      mode = "drun";
      allow_images = true;
    };
  };

  home.packages = with pkgs; [
    hyprpolkitagent
    networkmanagerapplet
    libsecret
    seahorse
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  qt.enable = true;
  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };

  wayland.windowManager.hyprland.settings = let
    monitor_primary = "HDMI-A-4";
    monitor_secondary = "eDP-1";
  in {
    "$mod" = "SUPER";

    monitor = [
      "${monitor_primary}, 1920x1080@60, 0x0, 1"
      "${monitor_secondary}, 1920x1080@144, 1920x0, 1"
    ];

    workspace = [
      "1, monitor:${monitor_primary}, default:true"
      "2, monitor:${monitor_secondary}, default:true"
    ];

    cursor = {
      no_hardware_cursors = 1;
      default_monitor = "${monitor_primary}";
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

    master = {
      allow_small_split = true;
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

    bind =
      [
        "SUPER, Return, exec, alacritty"
        "SUPER, B, exec, com.google.Chrome"
        "SUPER, V, exec, code"
        "SUPER, F, exec, nautilus"
        "SUPER, M, exec, org.signal.Signal"
        "SUPER, K, exec, gnome-calculator"
        "SUPER, T, exec, gnome-text-editor"
        "SUPER, A, exec, wofi"
        # "SUPER, SUPER_L, exec, wofi"

        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"

        "SUPER SHIFT, left, swapwindow, l"
        "SUPER SHIFT, right, swapwindow, r"
        "SUPER SHIFT, up, swapwindow, u"
        "SUPER SHIFT, down, swapwindow, d"

        "SUPER, TAB, layoutmsg, swapwithmaster"
        "SUPER SHIFT, TAB, swapactiveworkspaces, ${monitor_primary} ${monitor_secondary}"

        "SUPER, Q, killactive"
        "SUPER, slash, togglefloating"
        "SUPER, F11, fullscreen, 1"
        ", F11, fullscreen, 0"

        "CTRL ALT, left, workspace, r-1"
        "CTRL ALT, right, workspace, r+1"
      ]
      ++ (
        # workspaces
        builtins.concatLists (builtins.genList (
            i: let
              ws = i + 1;
            in [
              "SUPER, code:1${toString i}, workspace, ${toString ws}"
              "SUPER SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );

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

    exec-once = [
      "waybar"
      "systemctl --user start hyprpolkitagent"
    ];
  };
}
