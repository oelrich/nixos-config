{config, pkgs, ... }:

{
  services.xserver.dpi = 180;

  boot = {
    initrd.kernelModules = [
      "ahci"
      "ehci_pci"
      "xhci_hcd"
      "vfat"
      "nls_cp437"
      "nls_iso8859-1"
      "usb_storage"
      "usbhid"
    ];
    kernelParams = [
      "video=1920x108"
    ];
    loader = {
      grub.gfxmodeEfi = "1920x108";
    };
  };
}