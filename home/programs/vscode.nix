{
  pkgs,
  lib,
  inputs,
  ...
}: {
  nixpkgs.overlays = [
    inputs.nix-vscode-extensions.overlays.default
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

      userSettings = {
        "debug.console.fontSize" = lib.mkForce 12;
        "terminal.integrated.fontSize" = lib.mkForce 12;
        "terminal.integrated.enablePersistentSessions" = false;
        "editor.fontSize" = lib.mkForce 14;
        "editor.tabSize" = 2;
        "editor.renderWhitespace" = "trailing";
        "editor.formatOnSave" = true;
        "editor.folding" = false;
        "editor.glyphMargin" = false;
        "workbench.layoutControl.enabled" = false;
        "window.menuBarVisibility" = "toggle";
        "telemetry.telemetryLevel" = "off";

        "git.confirmSync" = false;
        "git.autofetch" = true;

        "github.copilot.enable" = {
          "*" = true;
          "yaml" = true;
          "plaintext" = true;
          "markdown" = true;
        };

        "[javascript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[typescript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[typescriptreact]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[markdown]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[json]"."editor.defaultFormatter" = "esbenp.prettier-vscode";

        "prettier.semi" = false;
        "prettier.trailingComma" = "all";
        "prettier.experimentalTernaries" = true;

        "notes.notesLocation" = "/home/mrrain/Dokumenty/Markdown";

        "files.associations" = {
          "*.css" = "tailwindcss";
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
