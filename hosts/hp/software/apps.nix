{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    brave
    google-chrome
    obs-studio
    libreoffice-fresh
    spotify
    discord
  ];
}
