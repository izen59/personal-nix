{ config, pkgs, lib, ... }:

{
  imports = [
    ./niri/niri.nix
    ./stylix.nix
  ];
}
