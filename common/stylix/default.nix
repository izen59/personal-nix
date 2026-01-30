{ inputs, config, pkgs, ... }:

{
  imports = [
    ./stylix.nix
    ./gtk.nix
    ./qt.nix
    
  ];
}
