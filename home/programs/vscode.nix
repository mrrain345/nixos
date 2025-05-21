{
  pkgs,
  lib,
  inputs,
  config,
  ...
}: {
  nixpkgs.overlays = [
    inputs.nix-vscode-extensions.overlays.default
  ];

  home.packages = with pkgs; [
    nil
    nixd
    alejandra

    nodejs
  ];

  programs.vscode = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-marketplace; [
        # General
        github.copilot
        github.copilot-chat
        usernamehw.errorlens
        aaron-bond.better-comments
        eamodio.gitlens
        mhutchie.git-graph

        # Markdown
        darkriszty.markdown-table-prettify
        takumii.markdowntable
        bierner.markdown-checkbox
        bierner.markdown-emoji
        bierner.markdown-footnotes
        bierner.markdown-mermaid
        bierner.markdown-yaml-preamble
        dionmunk.vscode-notes

        # Web
        bradlc.vscode-tailwindcss
        esbenp.prettier-vscode
        rvest.vs-code-prettier-eslint

        # Doker
        jeff-hykin.better-dockerfile-syntax
        docker.docker
        ms-azuretools.vscode-docker

        # Other
        qwtel.sqlite-viewer
        fill-labs.dependi
        tamasfe.even-better-toml
        jnoortheen.nix-ide
      ];

      userSettings = let
        fonts = config.stylix.fonts;
        fontSize = lib.mkForce (fonts.sizes.desktop * 4.0 / 3.0);
        monospace = lib.mkForce "'${fonts.monospace.name}', monospace";
      in {
        "editor.fontSize" = fontSize;
        "debug.console.fontSize" = fontSize;
        "terminal.integrated.fontSize" = fontSize;
        "chat.editor.fontSize" = fontSize;
        "editor.inlineSuggest.fontFamily" = monospace;

        "editor.folding" = false;
        "editor.glyphMargin" = false;
        "editor.renderWhitespace" = "trailing";
        "window.menuBarVisibility" = "toggle";
        "terminal.integrated.enablePersistentSessions" = false;
        "telemetry.telemetryLevel" = "off";

        "editor.tabSize" = 2;
        "editor.formatOnSave" = true;
        "git.confirmSync" = false;
        "git.autofetch" = true;

        "notes.notesLocation" = "/home/mrrain/Dokumenty/Markdown";

        "prettier.semi" = false;
        "prettier.trailingComma" = "all";
        "prettier.experimentalTernaries" = true;

        "[javascript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[typescript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[typescriptreact]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[markdown]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[json]"."editor.defaultFormatter" = "esbenp.prettier-vscode";

        "files.associations" = {
          "*.css" = "tailwindcss";
        };

        "github.copilot.enable" = {
          "*" = true;
          "yaml" = true;
          "plaintext" = true;
          "markdown" = true;
        };

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nix.formatterPath" = "alejandra";
        "nix.serverSettings" = {
          "nil" = {
            "formatting"."command" = ["alejandra"];
            "options"."nixos" = {
              "expr" = "(builtins.getFlake \"$NH_FLAKE\").nixosConfigurations.nixos.options";
            };
          };
          "nixd" = {
            "formatting"."command" = ["alejandra"];
            "options"."nixos" = {
              "expr" = "(builtins.getFlake \"$NH_FLAKE\").nixosConfigurations.nixos.options";
            };
          };
        };
      };
    };
  };
}
