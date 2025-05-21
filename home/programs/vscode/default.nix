{pkgs, ...}: {
  imports = [
    ./extensions.nix
    ./settings.nix
  ];

  programs.vscode.enable = true;

  home.packages = with pkgs; [
    nil
    nixd
    alejandra

    nodejs
  ];
}
