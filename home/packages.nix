{pkgs, ...}: {
  home.packages = with pkgs; [
    nixd
    nil
    alejandra
    vscode.fhs

    nodejs
  ];
}
