{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.stylix.homeManagerModules.stylix

    ./stylix.nix
    ./gtk.nix
    ./qt.nix

  ];
}
