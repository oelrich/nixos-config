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
      idea-ultimate
    ];
	  netPack = with pkgs; [
      firefox
      davmail
      thunderbird
      pidgin
      pidgin-skypeweb
      telegram-purple
    ];
    in guiPack ++ xmonadPack ++ graphicsPack ++ editorPack ++ netPack;

  hardware.opengl =  {
    driSupport = true;
  };

  services = {
    compton = {
      enable = true;
    };
    xserver = {
      enable = true;
      layout = "se";
      desktopManager.xterm.enable = false;
      displayManager.lightdm.enable=true;
      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
      };
    };
  };
}
