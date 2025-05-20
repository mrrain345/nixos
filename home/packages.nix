{pkgs, ...}: {
  home.packages = with pkgs; [
    nil
    nixd
    alejandra

    nodejs

    alacritty
    nautilus

    adwaita-fonts
  ];
}
