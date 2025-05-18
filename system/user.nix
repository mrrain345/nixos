{
  pkgs,
  inputs,
  ...
}: {
  programs.zsh.enable = true;

  users.users.mrrain = {
    isNormalUser = true;
    description = "MrRaiN";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users.mrrain = import ../home/home.nix;
  };
}
