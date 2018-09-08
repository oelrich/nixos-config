{ config, pkgs, ... }:

{
  imports =
    [ ../guestHyperV.nix
      ../../xmonadGui.nix
      ../../hdpi.nix ];

  networking.hostName = "snaxos";
}