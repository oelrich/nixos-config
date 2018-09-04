{ config, pkgs, ... }:

{
  environment.systemPackages = 
	let guiPack = with pkgs;
    [ xorg.xkill
      xorg.xeyes
      xorg.xclock
      compton dzen2 ];
	xmonadPack = with pkgs; [ haskellPackages.xmobar ];
	graphicsPack = with pkgs; [ feh ffmpeg imagemagick ];
    editorPack = with pkgs; [ vscode ];
	netPack = with pkgs; [ firefox thunderbird ];
    in guiPack ++ xmonadPack ++ graphicsPack ++ editorPack ++ netPack;

  hardware.opengl =  {
    driSupport = true;
  };

#  systemd.user.services."urxvtd" = {
#    enable = true;
#    description = "rxvt unicode daemon";
#    wantedBy = [ "defautl.target" ];
#    path = [pkgs.rxvt_unicode ];
#    serviceConfig = {
#      Restart = "always";
#      RestartSec = 2;
#      ExecStart = "${pkgs.rxvt_unicode}/bin/urxvtd -q -o";
#    };
#  };

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
