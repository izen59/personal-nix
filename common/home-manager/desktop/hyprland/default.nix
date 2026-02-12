{ config, pkgs, lib, ... }:

{
  imports = [
    ./hyprland.nix

    # Select noctalia
    #./noctalia/default.nix
  ];
}
