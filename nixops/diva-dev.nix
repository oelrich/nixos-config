{
    network.description = "DiVA - Dev. Env.";

    diva-dev = { config, pkgs, lib, ... }: {
        imports = [ ../machines/libvirtd-diva-dev/default.nix ];
    };
}