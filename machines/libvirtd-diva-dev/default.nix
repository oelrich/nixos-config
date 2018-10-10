{ config, pkgs, ... }:

{
  imports =
    [ ../guestLibvirtd.nix
      ../../xmonadGui.nix
      ../../javaDev.nix
      ../../hdpi.nix ];

  networking.hostName = "DiVA";
}