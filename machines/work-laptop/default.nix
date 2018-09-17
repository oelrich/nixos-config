{ config, pkgs, ... }:

{
  imports = [
    ../thinkpad-p50.nix
    ../../javaDev.nix
    ];

  networking.hostName = "hex";
}
