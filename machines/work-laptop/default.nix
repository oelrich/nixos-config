{ config, pkgs, ... }:

{
  imports = [
    ../thinkpad-p50.nix
    ../../javaDev.nix
    ../../hostLibvirtd.nix
    ];

  networking.hostName = "hex";
}
