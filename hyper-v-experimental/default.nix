{ config, pkgs, ... }:

{
  imports =
    [ ../../hardware-configuration.nix
      ../common.nix
    ];

  networking.hostName = "snaxos";
}