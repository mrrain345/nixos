{pkgs, ...}: {
  home.packages = with pkgs; [
    nil
    alejandra
    vscode.fhs

    nodejs

    alacritty
    nautilus

    adwaita-fonts
  ];
}
