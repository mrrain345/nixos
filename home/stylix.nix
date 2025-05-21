{pkgs, ...}: {
  stylix = {
    enable = true;
    image = ./files/wallpaper.png;
    # https://tinted-theming.github.io/tinted-gallery/
    base16Scheme = "${pkgs.base16-schemes}/share/themes/da-one-ocean.yaml";
    polarity = "dark";

    fonts = {
      serif = {
        package = pkgs.fira-go;
        name = "Fira Sans";
      };
      sansSerif = {
        package = pkgs.fira-go;
        name = "Fira Sans";
      };
      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "Fira Code Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };

    fonts.sizes = {
      applications = 12;
      desktop = 10;
      popups = 10;
      terminal = 12;
    };

    opacity = {
      applications = 1.0;
      desktop = 0.9;
      popups = 1.0;
      terminal = 0.8;
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
  };

  fonts.packages = with pkgs; [
    font-awesome
    noto-fonts
    noto-fonts-extra
    material-icons
    dejavu_fonts
    adwaita-fonts
    roboto
    inter
  ];
}
