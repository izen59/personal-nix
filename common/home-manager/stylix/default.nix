{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.stylix.homeModules.stylix

    ./stylix.nix
    ./gtk.nix
    ./qt.nix
    ./noctalia.nix
    ./hyprland.nix
    ./kitty.nix
    ./firefox.nix

  ];
}
