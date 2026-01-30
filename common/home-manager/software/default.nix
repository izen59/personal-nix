{ config, pkgs, user, ... }:

{
  imports = [
    ./terminal/fish.nix
    ./terminal/starship.nix
    ./terminal/kitty.nix
    ./firefox-bookmarks.nix
    ./linux-wallpaperengine.nix
  ];
}
