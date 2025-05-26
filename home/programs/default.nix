{pkgs, ...}: {
  imports = [
    ./vscode
    ./git.nix
    ./nano.nix
    ./nh.nix
    ./zsh.nix
  ];

  programs.alacritty.enable = true;

  home.packages = with pkgs; [
    nautilus
    gnome-text-editor
    gnome-calculator

    seahorse
    gnome-disk-utility
  ];
}
