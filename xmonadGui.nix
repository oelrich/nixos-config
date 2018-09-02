{ config, pkgs, ... }:

{
  environment.systemPackages = 
	let guiPack = with pkgs; [ xorg.xkill xorg.xeyes xorg.xclock compton dzen2 ];
	xmonadPack = with pkgs; [ haskellPackages.xmobar ];
	graphicsPack = with pkgs; [ feh ffmpeg imagemagick ];
    editorPack = with pkgs; [ vscode ];
	netPack = with pkgs; [ firefox thunderbird ];
    in guiPack ++ xmonadPack ++ graphicsPack ++ editorPack ++ netPack;

  hardware.opengl =  {
    driSupport = true;
  };

  services.xserver = {
    enable = true;
    layout = "se";
#    xkbOptions = "eurosign:e";
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
#      extraPackages = self: [];
    };
  };
}