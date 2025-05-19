{pkgs, ...}: {
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    fira-code
  ];

  fonts = {
    fontconfig.enable = true;
    fontconfig.defaultFonts = {
      sansSerif = ["Noto Sans"];
      serif = ["Noto Serif"];
      emoji = ["Noto Color Emoji"];
      monospace = ["Fira Code"];
    };
  };
}
