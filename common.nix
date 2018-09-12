{ config, pkgs, ... }:

{
  imports = [
    ../hardware-configuration.nix
    ./yubikey.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.config.allowUnfree = true;

  i18n = {
    consoleFont = "Lat2-Monospace-16";
    consoleKeyMap = "sv-latin1";
    defaultLocale = "en_GB.utf-8";
  };

  time.timeZone = "Europe/Stockholm";

  networking.timeServers = [ "ntp.uu.se" ];

  environment.systemPackages = with pkgs; [
      fish
      tmux
      curl
      jq
      git
      irssi
    ];

  programs.fish.enable = true;
  programs.tmux.enable = true;
  
  services.openssh = {
    enable = true;
    forwardX11 = true;
    permitRootLogin = "no";
  };

  services.acpid.enable = true;
  services.locate.enable = true;

  fonts = {
    fonts = with pkgs; [
      corefonts
      inconsolata
      emojione
      noto-fonts
      noto-fonts-emoji
      fira
      fira-code
      fira-mono
      dejavu_fonts
      ubuntu_font_family
      unifont
    ];
  };

  users.users.oelrich = {
    isNormalUser = true;
    home = "/home/oelrich";
    shell = pkgs.fish;
    description = "Johan Oelrich";
    extraGroups = [ "oelrich" "wheel" ];
  };

  # Horrendous hack ...
  system.activationScripts.dotfiles =
      ''
        rm -rf /home/oelrich/.xmonad
        rm -rf /home/oelrich/.xmobarrc
        rm -rf /home/oelrich/.tmux.conf
        chown -R oelrich /etc/nixos/nixos-config/user
        ln -s /etc/nixos/nixos-config/user/xmonad /home/oelrich/.xmonad
        ln -s /etc/nixos/nixos-config/user/xmobarrc /home/oelrich/.xmobarrc
        ln -s /etc/nixos/nixos-config/user/tmux.conf /home/oelrich/.tmux.conf
      '';

  system.autoUpgrade.enable = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  boot.kernel.sysctl = {
    "fs.inotify.max_user_watches" = 1048576;
    "fs.inotify.max_user_instances" = 1024;
    "fs.inotify.max_queued_events" = 32768;
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.03"; # Did you read the comment?
}
