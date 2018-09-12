{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      jetbrains.idea-ultimate
      openjdk10
      ];
}
      