{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    python313Packages.qtile
    rofi
    ranger
  ];

  # Configure Qtile and related dotfiles
  home.file = {
    # ".config/qtile".source = /home/nicolas/.dotfiles/config/qtile;
    # ".config/rofi".source = /home/nicolas/.dotfiles/config/rofi;
    # ".config/ranger".source = /home/nicolas/.dotfiles/config/ranger;
  };

  home.sessionVariables = {
    QTILE_CONFIG = "${config.home.homeDirectory}/.config/qtile/config.py";
  };

  home.shellAliases = {
    qtile-reload = "qtile cmd-obj -o cmd -f reload_config";
    qtile-restart = "qtile cmd-obj -o cmd -f restart";
    qtile-quit = "qtile cmd-obj -o cmd -f shutdown";
    qtile-check = "python -m py_compile ~/.config/qtile/config.py";
    qtile-log = "journalctl --user -f _COMM=qtile";

    qtile-next = "qtile cmd-obj -o group -f next_window";
    qtile-prev = "qtile cmd-obj -o group -f prev_window";
    qtile-kill = "qtile cmd-obj -o window -f kill";

    qtile-next-layout = "qtile cmd-obj -o group -f next_layout";
    qtile-prev-layout = "qtile cmd-obj -o group -f prev_layout";

    qtile-screens = "qtile cmd-obj -o cmd -f list_screens";
    qtile-windows = "qtile cmd-obj -o cmd -f windows";
  };
}
