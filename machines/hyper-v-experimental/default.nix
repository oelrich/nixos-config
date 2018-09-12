{ config, pkgs, ... }:

{
  imports =
    [ ../guestHyperV.nix
      ../../xmonadGui.nix
      ../../javaDev.nix
      ../../hdpi.nix ];

  networking.hostName = "snaxos";
}