{ config, lib, pkgs, ... }:

with lib;

{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.gnome = {
    core-apps.enable = false;
    core-developer-tools.enable = false;
    games.enable = false;
  };

  environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs ];
}
