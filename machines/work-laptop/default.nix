{ config, pkgs, ... }:

{
  imports = [ ../thinkpad-p50.nix ];

  networking.hostName = "hex";
}
