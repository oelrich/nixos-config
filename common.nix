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
    consoleFont = "lat9w-24";
    consoleKeyMap = "sv-latin1";
    defaultLocale = "en_GB.utf-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages =
    let base = with pkgs; [ curl emacs fish tmux ];
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
      ubuntu_font_family
      unifont
    xorg.fontadobeutopia100dpi
    xorg.fontadobeutopia75dpi
    xorg.fontadobeutopiatype1
    xorg.fontalias
    xorg.fontarabicmisc
    xorg.fontbh100dpi
    xorg.fontbh75dpi
    xorg.fontbhlucidatypewriter100dpi
    xorg.fontbhlucidatypewriter75dpi
    xorg.fontbhttf
    xorg.fontbhtype1
    xorg.fontbitstream100dpi
    xorg.fontbitstream75dpi
    xorg.fontbitstreamtype1
    xorg.fontcronyxcyrillic
    xorg.fontcursormisc
    xorg.fontdaewoomisc
    xorg.fontdecmisc
    xorg.fontibmtype1
    xorg.fontisasmisc
    xorg.fontjismisc
    xorg.fontmicromisc
    xorg.fontmisccyrillic
    xorg.fontmiscethiopic
    xorg.fontmiscmeltho
    xorg.fontmiscmisc
    xorg.fontmuttmisc
    xorg.fontschumachermisc
    xorg.fontscreencyrillic
    xorg.fontsonymisc
    xorg.fontsproto
    xorg.fontsunmisc
    xorg.fontutil
    xorg.fontwinitzkicyrillic
    xorg.fontxfree86type1
    ];
  };

  users.users.oelrich = {
    isNormalUser = true;
    home = "/home/oelrich";
    shell = pkgs.fish;
    description = "Huge Nerd";
    extraGroups = [ "oelrich" "wheel" ];
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.03"; # Did you read the comment?

}
