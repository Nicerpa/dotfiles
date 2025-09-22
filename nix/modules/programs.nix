{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Core programs
    neovim
    tmux
    git
    firefox
    vscode
    alacritty
    qtile
    
    # Terminal tools
    eza
    ranger
    rofi
    
    # Development tools
    kubectl
    kubernetes-helm
    
    # Fonts
    nerdfonts
  ];

  # Program-specific configurations using Home Manager modules
  programs.git = {
    enable = true;
    # Additional git configuration can be added here
  };
  
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.tmux = {
    enable = true;
    # Additional tmux configuration can be added here
  };

  programs.firefox = {
    enable = true;
    # Additional firefox configuration can be added here
  };

  programs.alacritty = {
    enable = true;
    # Native alacritty configuration can be added here instead of linking config files
  };

  programs.rofi = {
    enable = true;
    # Native rofi configuration can be added here instead of linking config files
  };
}