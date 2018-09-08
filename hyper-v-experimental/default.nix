{ config, pkgs, ... }:

{
  imports =
    [ ../../hardware-configuration.nix
      ../common.nix
      ../hdpi.nix
      ../guestHyperV.nix
    ];

  networking.hostName = "snaxos";
}