# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./qbittorrent.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Santiago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CL.UTF-8";
    LC_IDENTIFICATION = "es_CL.UTF-8";
    LC_MEASUREMENT = "es_CL.UTF-8";
    LC_MONETARY = "es_CL.UTF-8";
    LC_NAME = "es_CL.UTF-8";
    LC_NUMERIC = "es_CL.UTF-8";
    LC_PAPER = "es_CL.UTF-8";
    LC_TELEPHONE = "es_CL.UTF-8";
    LC_TIME = "es_CL.UTF-8";
  };

  services.logmein-hamachi.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "latam";
    variant = "";
  };

  services.openssh = {
    enable = true;
    settings = { 
       PasswordAuthentication = false;
    };
  };

  services.vaultwarden = {
    enable = true;
    # dbBackend = "postgresql";
    # Store your variables like admin password here
    # environmentFile = "/home/nicolas/vaultwarden/.env";
    # config = {
      # SIGNUPS_ALLOWED = false;
      # DOMAIN = "https://vaultwarden.example.com";
    # };
  };

  services.openvpn.servers = {
    serverVPN  = { config = '' config /home/nicolas/openvpn/anime-vpn.ovpn ''; };
  };

  services.qBittorrent = {
    enable = true;
    user = "nicolas";
    dataDir = "/home/nicolas";
    openFirewall = true;
    webUIAddress.port = 8081;
  };

  security.acme = {
    acceptTerms = true;
    email = "homelab@nicolascerpa.cl";
  };

  services.nginx.enable = true;
  services.nginx.virtualHosts = let
    SSL = {
      forceSSL = true;
    }; in {
      "torrent.box" = (SSL // {
        locations."/".proxyPass = "http://127.0.0.1:8080/";
	enableACME = true;

        serverAliases = [
          "qbittorrent.box"
        ];
      });

      #"sub.domain.tld" = (SSL // {
        #locations."/".proxyPass = "http://127.0.0.1:8081/";
      #});
    };

  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user="nicolas";
  };

  # Configure console keymap
  console.keyMap = "la-latin1";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nicolas = {
    isNormalUser = true;
    description = "Nicolas";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    openssh = {
      authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCpoC4s356Ngvwyv3WtwSx6WKbgeOHEw3QTeasnJqcoKvRfPVBK6UPUzZk3ks+GjtVKpbnm2MbWd9uH54PkPk0kNlfhMXrL8n5YTz8TuXix4T3WyBm5KnTwRhtVsCkYd0RJ6myhD2Y/G+HLWTgUd91vImlKVD+JTpEezi0dy9G5g/ifJYN3lsJBYpFYGY/4Lpzs7RkTMhhSbQ0rsreWfHC9uuYHnFlPBFJAPIscVdPIq5kpd2lHv3zg/rMQ43MhlBldHeCrjbwvxMqxr7fJLo7xDli+TCf8Fm2iDui4fDFr21eCKidXHOsqLMfLZE8Za/p6TV9jNpTWOSF2kIrSXFJCB0B774kjto9LG/P3xYHjWX7qYhubC65La9e7zrOlYJaZMtU+3rMwV8KdSCjuO8w9kMQhl5JKQvS42K9LvI4FxSoPh33xu/W83qb2grRnudoIMIZ1Ft4Sg8IvEGEj6oPOewQOcZHAN3PSQudqAJnLtNDIMOvCYOzQcHJ8ZMLmAkM= nicolas@4b"
	"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC5QdjR4g5W5wbV65MM9fG2VWUucFOgHyn0E4r/Kw3NrlrkynJOhJiWpX7x4jWFm2ZIw2PwnEQuH0R0X4hLf7/2l8VOPzX9k4C6eFtVGW7kMUIPFErhf1hcaUiceVWIKrl8upuR7Dgx+g3Icqh5TYFTeLrI37AZ751+8IwONk2Bq9KiNOPAuuSZP+nZwUDwC2Kox+L4fo2rFgNrt285zLKSUkwmvHt0xwt5HyuA5shUfJvyyHpjm/xJchLzeFFmwKxKS3C1tt0Ll1JNOLn00Dl6MozQDgRBFEoTvZcfUlw6mg24WBW859pRKHYFDN1VWVD2/EoLNCsPTUa7pDaIBrT42jsqSuLjYPfA3Fk88Qzea8Y0FuaUZYksGFkweuMwcuOu/9FSLAoN2FMo/FECAGEvVJb1EzpthF6xiy2VHcl61eY8dwsFz6SVLYfmZzOYiEn5a3KJNQ8/0wqZjKNF9wD+PyQm1cKKuhdg0ZtOpfgEN+s4traz0vZEj3wOPIVB1vM= nicolas@MacBook-Pro-de-nursoft-3.local"
      ];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    git
    pkgs.neovim
    pkgs.vimPlugins.nvchad  
    pkgs.openvscode-server
    pkgs.docker_26
    pkgs.python3
    pkgs.qbittorrent-nox
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
    pkgs.logmein-hamachi
    pkgs.jdk
    pkgs.tmux
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ 8222 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
