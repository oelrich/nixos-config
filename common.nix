{ config, pkgs, ... }:

{
  imports = [
    ../hardware-configuration.nix
    ./virtualCommon.nix];
}
