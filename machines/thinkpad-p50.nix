{ config, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
      ../common.nix
      ../wifi.nix
      ../hdpi.nix
    ];

  boot.initrd.availableKernelModules = [ 
    "ahci"
    "ehci_pci" 
    "nls_cp437"
    "nls_iso8859-1"
    "usb_storage"
    "usbhid"
    "xhci_hcd"
    "vfat"
  ];

  # sound
  boot.extraModprobeConfig = ''
      options snd_hda_intel enable=0,1
  '';

  boot.kernelModules = [ "kvm-intel" "fbcon" ];
  
  services.xserver.libinput  = { 
    enable = true;
    naturalScrolling = false;
    middleEmulation = true;
    tapping = true;
  };
}