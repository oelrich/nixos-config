{ config, pkgs, ... }:

{
  environment.systemPackages = 
  	let guiPack = with pkgs; [
      xorg.xkill
      xorg.xeyes
      xorg.xclock
      termite
      dmenu
      compton
      slock
      scrot
      dzen2
    ];
	  xmonadPack = with pkgs; [
      haskellPackages.xmobar
    ];
    graphicsPack = with pkgs; [
      feh
      ffmpeg
      imagemagick
    ];
    editorPack = with pkgs; [
      vscode
    ];
	  netPack = with pkgs; [
      firefox
      thunderbird
      skype
      tdesktop
    ];
    in guiPack ++ xmonadPack ++ graphicsPack ++ editorPack ++ netPack;

  hardware.opengl =  {
    driSupport = true;
  };

  services.xserver = {
    enable = true;
    layout = "se";
    desktopManager.xterm.enable = false;
    displayManager.lightdm.enable=true;
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };
  };
}
