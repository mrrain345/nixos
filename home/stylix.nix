{pkgs, ...}: {
  stylix = {
    enable = true;
    image = ./files/wallpaper.png;
    polarity = "dark";

    # https://tinted-theming.github.io/tinted-gallery/
    base16Scheme = {
      base00 = "171726";
      base01 = "22273d";
      base02 = "374059";
      base03 = "787C99";
      base04 = "353945";
      base05 = "a0a8cd";
      base06 = "abb2bf";
      base07 = "bcc2dc";
      base08 = "ee6d85";
      base09 = "f6955b";
      base0A = "d7a65f";
      base0B = "95c561";
      base0C = "9fbbf3";
      base0D = "7199ee";
      base0E = "a485dd";
      base0F = "773440";
    };

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
    cantarell-fonts
  ];
}
