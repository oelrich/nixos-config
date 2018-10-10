{config, pkgs, ... }:

{
    virtualisation.libvirtd.enable = true;
    users.users.oelrich.extraGroups = [ "libvirtd" ];
    networking.firewall.checkReversePath = false;

}