{ config, pkgs, ... }:

{
  imports =
    [ ../../hardware-configuration.nix
      ../common.nix
      ../wifi.nix
    ];

  networking.hostName = "hex";
}