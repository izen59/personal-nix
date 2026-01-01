{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    brave
    chromium
    mpv
    haruna
    spotify
    discord
    libreoffice-fresh
    qbittorrent
  ];
}
