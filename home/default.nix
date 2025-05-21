{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./stylix.nix
  ];

  users.users.mrrain = {
    isNormalUser = true;
    description = "MrRaiN";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };

  home-manager = {
    users.mrrain = import ./home.nix;
    extraSpecialArgs = {inherit inputs;};
    useUserPackages = true;
  };

  programs.zsh.enable = true;
  programs.hyprland.enable = true;
}
