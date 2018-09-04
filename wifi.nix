{ config, pkgs, ...}:

{
  imports = [ ../wifi_ssid.nix ];
  networking.wireless.enable = true;
}