{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      docker
      jetbrains.idea-ultimate
      zulu
      visualvm
      maven
      ];
  virtualisation.docker.enable = true;
  users.users.oelrich.extraGroups = [ "docker" ];
}
      