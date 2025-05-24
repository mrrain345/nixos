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
    self,
    nixpkgs,
    ags,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system} = {
      default = ags.lib.bundle {
        inherit pkgs;
        src = ./.;
        name = "my-shell";
        entry = "app.ts";
        gtk4 = false;

        # additional libraries and executables to add to gjs' runtime
        extraPackages = with ags.packages.${system}; [
          apps
          hyprland
          battery
          bluetooth
          network
          notifd
          powerprofiles
          tray
          mpris
          wireplumber
        ];
      };
    };

    devShells.${system} = {
      default = pkgs.mkShell {
        buildInputs = [
          # includes astal3 astal4 astal-io by default
          (ags.packages.${system}.default.override {
            extraPackages = with ags.packages.${system}; [
              # cherry pick packages
              apps
              hyprland
              battery
              bluetooth
              network
              notifd
              powerprofiles
              tray
              mpris
              wireplumber
            ];
          })
        ];
      };
    };
  };
}
