{config, pkgs, ... }:

{
  imports = [ ../virtualCommon.nix ];
  
  services.xserver.videoDrivers = [ "hyperv_fb" "fbcon" ];
  boot = {
    initrd.kernelModules = [
      "hyperv_fb"
    ];
  };
}