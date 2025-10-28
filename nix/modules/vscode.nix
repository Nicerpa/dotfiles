{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    
    extensions = with pkgs.vscode-extensions; [
      # Language Support
      ms-python.python                              # Python language support
      ms-python.vscode-pylance                      # Python language server
      rust-lang.rust-analyzer                       # Rust analyzer
      redhat.vscode-yaml                            # YAML language support
      
      # DevOps and Infrastructure
      ms-kubernetes-tools.vscode-kubernetes-tools   # Kubernetes tools
      ms-vscode-remote.remote-containers             # Remote containers
      ms-vscode-remote.remote-ssh                    # Remote SSH
      ms-vscode-remote.remote-ssh-edit               # Remote SSH editing
      ms-azuretools.vscode-docker                    # Docker support
      
      # Git and Version Control
      eamodio.gitlens                               # GitLens
      
      # Productivity and Utilities
      vscodevim.vim                                 # Vim keybindings
      bbenoist.nix                                  # Nix language support
      pkief.material-icon-theme                     # Material Icon Theme
      vscode-icons-team.vscode-icons                # VSCode Icons
      
      # Code Quality and Formatting
      ms-vscode.vscode-eslint                       # ESLint
      editorconfig.editorconfig                     # EditorConfig
      
      # GitHub Integration
      github.copilot                                # GitHub Copilot
      github.copilot-chat                           # GitHub Copilot Chat
      
      # Themes
      sdras.night-owl                               # Night Owl theme
      zhuangtongfa.material-theme                   # One Dark Pro theme
      
      # Additional utilities
      # The following extensions might need to be installed manually or through other means:
      # aaron-bond.better-comments
      # adamhartford.vscode-base64
      # akamud.vscode-theme-onelight
      # docker.docker (different from ms-azuretools.vscode-docker)
      # mechatroner.rainbow-csv
      # mhutchie.git-graph
      # mjmcloug.vscode-elixir
      # ms-python.debugpy
      # ms-python.vscode-python-envs
      # ms-vscode.remote-explorer
      # ms-vscode.remote-server
      # oderwat.indent-rainbow
      # panicbit.cargo
      # tamasfe.even-better-toml
      # usernamehw.errorlens
      # virejdasani.incredibly-in-your-face
      # william-voyek.vscode-nginx
      # xabikos.javascriptsnippets
      # zxh404.vscode-proto3
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      # {
      #   name = "better-comments";
      #   publisher = "aaron-bond";
      #   version = "3.0.2";
      #   sha256 = "sha256-hQmA8PWjf2Nd60v5EAuqqD8LIEu7slrNs8luc3ePgZc=";
      # }
      # {
      #   name = "vscode-base64";
      #   publisher = "adamhartford";
      #   version = "0.1.0";
      #   sha256 = "sha256-X9u9r2CbRX8VE0h7BN7ZHTlj9lIJZ6o7Xn/aYY2+8oE=";
      # }
      # {
      #   name = "rainbow-csv";
      #   publisher = "mechatroner";
      #   version = "3.11.0";
      #   sha256 = "sha256-X9u9r2CbRX8VE0h7BN7ZHTlj9lIJZ6o7Xn/aYY2+8oE=";
      # }
      # {
      #   name = "git-graph";
      #   publisher = "mhutchie";
      #   version = "1.30.0";
      #   sha256 = "sha256-X9u9r2CbRX8VE0h7BN7ZHTlj9lIJZ6o7Xn/aYY2+8oE=";
      # }
      # {
      #   name = "vscode-elixir";
      #   publisher = "mjmcloug";
      #   version = "1.1.0";
      #   sha256 = "sha256-X9u9r2CbRX8VE0h7BN7ZHTlj9lIJZ6o7Xn/aYY2+8oE=";
      # }
      # {
      #   name = "indent-rainbow";
      #   publisher = "oderwat";
      #   version = "8.3.1";
      #   sha256 = "sha256-X9u9r2CbRX8VE0h7BN7ZHTlj9lIJZ6o7Xn/aYY2+8oE=";
      # }
      # {
      #   name = "cargo";
      #   publisher = "panicbit";
      #   version = "0.2.3";
      #   sha256 = "sha256-X9u9r2CbRX8VE0h7BN7ZHTlj9lIJZ6o7Xn/aYY2+8oE=";
      # }
      # {
      #   name = "even-better-toml";
      #   publisher = "tamasfe";
      #   version = "0.19.2";
      #   sha256 = "sha256-X9u9r2CbRX8VE0h7BN7ZHTlj9lIJZ6o7Xn/aYY2+8oE=";
      # }
      # {
      #   name = "errorlens";
      #   publisher = "usernamehw";
      #   version = "3.16.0";
      #   sha256 = "sha256-X9u9r2CbRX8VE0h7BN7ZHTlj9lIJZ6o7Xn/aYY2+8oE=";
      # }
      # {
      #   name = "vscode-nginx";
      #   publisher = "william-voyek";
      #   version = "0.7.2";
      #   sha256 = "sha256-X9u9r2CbRX8VE0h7BN7ZHTlj9lIJZ6o7Xn/aYY2+8oE=";
      # }
      # {
      #   name = "javascriptsnippets";
      #   publisher = "xabikos";
      #   version = "1.8.0";
      #   sha256 = "sha256-X9u9r2CbRX8VE0h7BN7ZHTlj9lIJZ6o7Xn/aYY2+8oE=";
      # }
      # {
      #   name = "vscode-proto3";
      #   publisher = "zxh404";
      #   version = "0.5.5";
      #   sha256 = "sha256-X9u9r2CbRX8VE0h7BN7ZHTlj9lIJZ6o7Xn/aYY2+8oE=";
      # }
    ];
    
    # VSCode user settings
    userSettings = {
      # Window and UI Configuration
      "window.menuBarVisibility" = "toggle";
      "window.autoDetectColorScheme" = true;
      
      # Editor Configuration
      "editor.fontFamily" = "'Hack Nerd Font'";
      "editor.fontSize" = 18;
      "editor.minimap.enabled" = false;
      "editor.fontLigatures" = true;
      "editor.lineHeight" = 1.5;
      "editor.tabSize" = 2;
      "editor.insertSpaces" = true;
      "editor.detectIndentation" = false;
      "editor.renderWhitespace" = "boundary";
      "editor.rulers" = [ 80 120 ];
      "editor.wordWrap" = "on";
      "editor.scrollBeyondLastLine" = false;
      "editor.cursorBlinking" = "smooth";
      "editor.cursorSmoothCaretAnimation" = "on";
      
      # Theme and Appearance
      "workbench.colorTheme" = "One Dark Pro Darker";
      "workbench.preferredLightColorTheme" = "Night Owl Light (No Italics)";
      "workbench.preferredDarkColorTheme" = "Night Owl (No Italics)";
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.startupEditor" = "none";
      "workbench.editor.showTabs" = true;
      "workbench.editor.tabCloseButton" = "right";
      "window.zoomLevel" = 0;
      
      # File Explorer
      "explorer.confirmDelete" = false;
      "explorer.confirmDragAndDrop" = false;
      "explorer.openEditors.visible" = 0;
      
      # Terminal
      "terminal.integrated.fontFamily" = "'Hack Nerd Font', monospace";
      "terminal.integrated.fontSize" = 13;
      "terminal.integrated.shell.linux" = "${pkgs.zsh}/bin/zsh";
      "terminal.integrated.defaultProfile.linux" = "zsh";
      
      # Git Configuration
      "git.enableSmartCommit" = true;
      "git.confirmSync" = false;
      "git.autofetch" = false;
      "gitlens.blame.toggleMode" = "window";
      "gitlens.currentLine.enabled" = false;
      "gitlens.hovers.enabled" = false;
      
      # Language-specific settings
      "python.defaultInterpreterPath" = "${pkgs.python3}/bin/python";
      "python.analysis.typeCheckingMode" = "standard";
      "python.formatting.provider" = "black";
      "python.linting.enabled" = true;
      "python.linting.flake8Enabled" = true;
      
      # Vim configuration
      "vim.useSystemClipboard" = true;
      "vim.useCtrlKeys" = true;
      "vim.hlsearch" = true;
      "vim.leader" = "<space>";
      "vim.handleKeys" = {
        "<C-c>" = false;
        "<C-p>" = false;
        "<C-f>" = false;
        "<C-I>" = false;
        "<C-e>" = false;
        "<C-x>" = false;
        "<C-d>" = false;
        "<C-i>" = false;
        "<C-k>" = false;
        "<C-0>" = false;
        "<C-a>" = false;
      };
      
      # Remote development
      "remote.SSH.remotePlatform" = {
        "*" = "linux";
      };
      
      # Docker configuration
      "docker.containers.label" = "ContainerName";
      "docker.extension.enableComposeLanguageServer" = false;
      
      # Kubernetes configuration
      "vs-kubernetes" = {
        "disable-linters" = [ "resource-limits" ];
        "vs-kubernetes.crd-code-completion" = "disabled";
        "vscode-kubernetes.minikube-path-linux" = "/home/nicolas/.local/state/vs-kubernetes/tools/minikube/linux-amd64/minikube";
      };
      
      # GitHub Copilot
      "github.copilot.nextEditSuggestions.enabled" = true;
      
      # Extension-specific settings
      "vsicons.dontShowNewVersionMessage" = true;
      
      # Nix configuration
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "${pkgs.nil}/bin/nil";
      
      # Security and Privacy
      "telemetry.telemetryLevel" = "off";
      "redhat.telemetry.enabled" = false;
      "update.mode" = "none";
      "extensions.autoUpdate" = false;
      
      # Performance
      "search.exclude" = {
        "**/node_modules" = true;
        "**/bower_components" = true;
        "**/.git" = true;
        "**/dist" = true;
        "**/build" = true;
        "**/target" = true;
        "**/.next" = true;
      };
      "files.watcherExclude" = {
        "**/.git/objects/**" = true;
        "**/.git/subtree-cache/**" = true;
        "**/node_modules/**" = true;
        "**/dist/**" = true;
        "**/build/**" = true;
      };
    };
    
    keybindings = [
      {
        key = "ctrl+shift+e";
        command = "workbench.view.explorer";
      }
      {
        key = "ctrl+shift+f";
        command = "workbench.view.search";
      }
      {
        key = "ctrl+shift+g";
        command = "workbench.view.scm";
      }
      {
        key = "ctrl+shift+d";
        command = "workbench.view.debug";
      }
      {
        key = "ctrl+shift+x";
        command = "workbench.view.extensions";
      }
      {
        key = "ctrl+shift+`";
        command = "workbench.action.terminal.toggleTerminal";
      }
      {
        key = "ctrl+shift+p";
        command = "workbench.action.showCommands";
      }
    ];
  };
  
  home.packages = with pkgs; [
    # Language servers and formatters
    nil                      # Nix language server
    nodePackages.prettier    # Code formatter
    nodePackages.eslint      # JavaScript linter
    black                    # Python formatter
    flake8                   # Python linter
    
    # Additional development tools
    nodePackages.typescript  # TypeScript compiler
    nodePackages.npm         # Node package manager
    nodejs                   # Node.js runtime
  ];
}