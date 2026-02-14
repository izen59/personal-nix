{ config, pkgs, lib, user, ... }:

{
  # ────────────────────────────── KDE Plasma Core ──────────────────────────────
  services.desktopManager.plasma6.enable = true;
  programs.xwayland.enable = true;

  # Authentication
  security.polkit.enable = true;

  # ────────────────────────────── MIME Defaults ──────────────────────────────
  xdg.mime = {
    enable = true;

    defaultApplications = {

    };
  };

  # ────────────────────────────── System Packages ──────────────────────────────
  environment.systemPackages = with pkgs; [
    kdePackages.sddm-kcm
  ];

  # ────────────────────────────── File Management Services ──────────────────────────────
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # ────────────────────────────── KDE Globals (Terminal preference) ─────────────────────
  environment.etc."xdg/kdeglobals".text = ''
    [General]
    TerminalApplication=kitty
    TerminalService=kitty.desktop
  '';
}
