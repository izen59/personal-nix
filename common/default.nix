# nix/desktop/ folder is imported in the default.nix of the specific machine, not here

{ config, inputs, ... }:

{
  imports = [
    ./nix/software/apps.nix
    ./nix/software/cachix.nix
    ./nix/software/distrobox.nix
    ./nix/software/firefox.nix
    #./nix/software/chromium.nix


    ./nix/hardware/bluetooth.nix
    ./nix/hardware/graphics.nix
    ./nix/hardware/locale.nix
    ./nix/hardware/system.nix
    ./nix/hardware/network.nix
    ./nix/hardware/printing.nix
    ./nix/hardware/sound.nix
    ./nix/hardware/user.nix
    ./nix/hardware/network-mounts.nix
    ./nix/hardware/system-hardening.nix
    ./nix/hardware/network-hardening.nix


    ./home-manager/default.nix
    ./stylix/default.nix
  ];
}
