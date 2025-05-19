{
  pkgs,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
    history.size = 10000;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    plugins = [
      {
        name = "powerlevel10k-config";
        src = ../files/p10k;
        file = "p10k.zsh";
      }
      {
        name = "zsh-powerlevel10k";
        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
        file = "powerlevel10k.zsh-theme";
      }
    ];

    initContent = let
      zshConfigFirst = lib.mkBefore ''
        # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
        # Initialization code that may require console input (password prompts, [y/n]
        # confirmations, etc.) must go above this block; everything else may go below.
        if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
          source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
        fi
      '';

      zshConfig = ''
        unsetopt correct # autocorrect commands

        setopt hist_ignore_all_dups # remove older duplicate entries from history
        setopt hist_reduce_blanks # remove superfluous blanks from history items
        setopt inc_append_history # save history entries as soon as they are entered

        # auto complete options
        setopt auto_list # automatically list choices on ambiguous completion
        setopt auto_menu # automatically use menu completion
        zstyle ':completion:*' menu select # select completions with arrow keys
        zstyle ':completion:*' group-name "" # group results by category
        zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

        # Set up history search bindings
        bindkey "''${key[Up]}" up-line-or-search
        bindkey "''${key[Down]}" down-line-or-search
      '';
    in
      lib.mkMerge [zshConfigFirst zshConfig];
  };
}
