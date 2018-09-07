{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./yubikey.nix
      ./xmonadGui.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.config.allowUnfree = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Monospace-16";
    consoleKeyMap = "sv-latin1";
    defaultLocale = "en_GB.utf-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages =
    let base = with pkgs; [ curl emacs fish tmux rxvt_unicode xterm ];
		devPack = with pkgs; [ jq git opam ];
		in base ++ devPack;

  programs.fish.enable = true;
  programs.tmux.enable = true;
  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.bash.enableCompletion = true;
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  networking = {
  #  networkmanager.enable = true;
#    firewall.allowedTCPPorts = [];
#    firewall.allowedUDPPorts = [];
  };

  services.openssh = {
    enable = true;
    forwardX11 = true;
    permitRootLogin = "no";
#    passwordAuthentication = false;
  };
  services.acpid.enable = true;
  services.locate.enable = true;


 # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;
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

  system.activationScripts.dotfiles =
      ''
        rm -rf /home/oelrich/.xmonad
        rm -rf /home/oelrich/.xmobarrc
        chown -R oelrich /etc/nixos/nixos-config/user
        ln -s /etc/nixos/nixos-config/user/xmonad /home/oelrich/.xmonad
        ln -s /etc/nixos/nixos-config/user/xmobarrc /home/oelrich/.xmobarrc
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
