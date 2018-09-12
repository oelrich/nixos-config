{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      jetbrains.idea-ultimate
      zulu
      visualvm
      ];
}
      