{pkgs, ...}: {
  stylix = {
    enable = true;
    image = ../../home/files/wallpaper.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark.yaml";
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
  };
}
