{ config, pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
        opensc pcsctools libu2f-host yubikey-personalization pam pam_u2f
        (openvpn.override { pkcs11Support = true;})
    ];
    services = {
        pcscd.enable = true;
        udev.packages = [
            pkgs.libu2f-host
            pkgs.yubikey-personalization
        ];
    };
    hardware.u2f.enable = true;

    security.pam = {
        enableU2F = true;
        services."oelrich".u2fAuth = true;
    };
}