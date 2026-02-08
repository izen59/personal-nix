{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    spotify
    (chromium.override { enableWideVine = true; })
    brave
    qbittorrent
    libreoffice-fresh
    discord
    filen-desktop
    jellyfin-desktop

    # from external personal flake
    #personal.blender-bin
    #personal.gmodpatchtool-bin
  ];
}
