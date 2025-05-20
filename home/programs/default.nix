{pkgs, ...}: {
  imports = [
    ./git.nix
    ./nano.nix
    ./nh.nix
    ./vscode.nix
    ./zsh.nix
  ];

  programs.alacritty.enable = true;

  home.packages = with pkgs; [
    nautilus
    gnome-text-editor
    gnome-calculator

    gnome-disk-utility
  ];
}
