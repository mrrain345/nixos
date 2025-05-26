{
  lib,
  config,
  ...
}: {
  programs.vscode.profiles.default = {
    userSettings = let
      fonts = config.stylix.fonts;
      fontSize = lib.mkForce (fonts.sizes.desktop * 4.0 / 3.0);
      bigFontSize = lib.mkForce (fonts.sizes.applications * 4.0 / 3.0);
      monospace = lib.mkForce "'${fonts.monospace.name}', monospace";
      sansSerif = lib.mkForce "'${fonts.sansSerif.name}', sans-serif";
    in {
      "editor.fontSize" = fontSize;
      "debug.console.fontSize" = fontSize;
      "markdown.preview.fontSize" = bigFontSize;
      "terminal.integrated.fontSize" = fontSize;
      "chat.editor.fontSize" = fontSize;
      "scm.inputFontSize" = fontSize;

      "editor.fontFamily" = monospace;
      "editor.inlayHints.fontFamily" = monospace;
      "editor.inlineSuggest.fontFamily" = monospace;
      "scm.inputFontFamily" = sansSerif;
      "debug.console.fontFamily" = monospace;
      "markdown.preview.fontFamily" = sansSerif;
      "chat.editor.fontFamily" = monospace;

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

      "notes.notesLocation" = "/home/mrrain/Documents/Markdown";

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

      "github.copilot.nextEditSuggestions.enabled" = true;
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
}
