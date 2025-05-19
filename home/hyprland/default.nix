{pkgs, ...}: {
  wayland.windowManager.hyprland.enable = true;

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    XCURSOR_SIZE = "24";
    HYPRCURSOR_SIZE = "24";
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  home.packages = with pkgs; [
    alacritty
    gnome-console

    nautilus

    adwaita-fonts
  ];

  gtk = {
    enable = true;

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    monitor = [
      "HDMI-A-4, 1920x1080, 0x0, 1"
      "eDP-1, 1920x1080, 1920x0, 1"
    ];

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
        "$mod, B, exec, flatpak run com.google.Chrome"
        "$mod, V, exec, code"
        "$mod, F, exec, nautilus"

        "$mod, Q, killactive"
        "$mod, slash, togglefloating"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (
            i: let
              ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
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
  };
}
