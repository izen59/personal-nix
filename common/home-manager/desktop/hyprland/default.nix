{ config, pkgs, lib, ... }:

{
  imports = [
    ./hyprland.nix

    # Select noctalia instead of dms
    #./noctalia/default.nix
  ];
}
