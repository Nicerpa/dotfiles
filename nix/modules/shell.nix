{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    history = {
      size = 5000;
      save = 5000;
      path = "${config.xdg.dataHome}/zsh/history";
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      expireDuplicatesFirst = true;
      share = true;
    };

    shellAliases = {
      # git aliases
      gco = "git checkout";
      ga = "git add";
      gaa = "git add --all";
      gb = "git branch";
      gc = "git commit";
      gcm = "git commit -m";
      gd = "git diff";
      gf = "git fetch";
      gl = "git log --oneline --decorate --all --graph";
      gm = "git merge";
      gp = "git push";
      grs = "git restore";
      gcl = "git clone";
      gfgpl = "git fetch && git pull";
      
      # ls aliases (using eza)
      ls = "eza --icons";
      ll = "ls -l";
      la = "ls -a";
      lla = "ls -la";
      l = "ls -CF";
      
      # docker aliases
      d = "docker";
      dc = "docker compose";
      dcb = "docker compose build";
      dcd = "docker compose down";
      dce = "docker compose exec";
      dcl = "docker compose logs";
      dcp = "docker compose ps";
      dcr = "docker compose run";
      dcu = "docker compose up";
    };

    initExtra = ''
      # Zinit setup
      ZINIT_HOME="''${XDG_DATA_HOME:-''${HOME}/.local/share}/zinit/zinit.git"
      if [ ! -d "$ZINIT_HOME" ]; then
         mkdir -p "$(dirname $ZINIT_HOME)"
         git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
      fi
      source "''${ZINIT_HOME}/zinit.zsh"

      # Powerlevel10k
      zinit ice depth=1; zinit light romkatv/powerlevel10k

      # Additional plugins
      zinit light Aloxaf/fzf-tab
      zinit cdreplay -q

      # Powerlevel10k config
      [[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh

      # Key bindings
      bindkey -e
      bindkey '^p' history-search-backward
      bindkey '^n' history-search-forward
      bindkey '^[w' kill-region

      autoload edit-command-line
      zle -N edit-command-line
      bindkey '^xe' edit-command-line

      # Completion styling
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
      zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

      # Shell integrations
      eval "$(fzf --zsh)"
      eval "$(zoxide init --cmd cd zsh)"
      
      # Kubectl and Helm completion
      command -v kubectl >/dev/null && source <(kubectl completion zsh)
      command -v helm >/dev/null && source <(helm completion zsh)

      # NVM
      export NVM_DIR="$HOME/.nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
      [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}