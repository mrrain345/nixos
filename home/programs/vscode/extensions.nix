{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.overlays = [
    inputs.nix-vscode-extensions.overlays.default
  ];

  programs.vscode.profiles.default = {
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
  };
}
