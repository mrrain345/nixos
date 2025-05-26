{
  description = "My Awesome Desktop Shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    ags,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system} = {
      default = ags.lib.bundle {
        inherit pkgs;
        src = ./.;
        name = "ags-shell";
        entry = "app.ts";
        gtk4 = false;

        extraPackages = with ags.packages.${system}; [
          apps
          hyprland
          battery
          bluetooth
          network
          notifd
          powerprofiles
          tray
          wireplumber

          pkgs.brightnessctl
        ];
      };
    };
  };
}
