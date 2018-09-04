{ config, pkgs, ... }:

{
  imports =
    [ ../../hardware-configuration.nix
      ../common.nix
      ../wifi.nix
    ];

  services.xserver.dpi = 180;
  networking.hostName = "hex";
}
