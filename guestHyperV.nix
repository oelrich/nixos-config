{config, pkgs, ... }:

{
  services.xserver.dpi = 180;
  services.xserver.videoDrivers = ["hyperv_fb"];
  boot = {
    initrd.kernelModules = [
      "hyperv_fb"
    ];
  };
}