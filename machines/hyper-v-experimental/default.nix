{ config, pkgs, ... }:

{
  imports =
    [ ../guestHyperV.nix
      ../../hdpi.nix ];

  networking.hostName = "snaxos";
}