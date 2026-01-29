{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    brave
    chromium
    spotify
    discord
    libreoffice-fresh
    qbittorrent
  ];
}
