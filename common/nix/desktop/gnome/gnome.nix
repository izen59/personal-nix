{ config, pkgs, lib, user, ... }:

{
  # ────────────────────────────── GNOME Core ──────────────────────────────
  services.desktopManager.gnome.enable = true;
  programs.xwayland.enable = true;

  # Authentication
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  # ────────────────────────────── MIME Defaults ──────────────────────────────
  xdg.mime = {
    enable = true;

    defaultApplications = {
    };
  };

  # ────────────────────────────── System Packages ──────────────────────────────
  environment.systemPackages = with pkgs; [
    ## GNOME Stuff
    gnome-tweaks
    gnome-browser-connector

    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock #idk maybe use the other one
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.vitals
  ];

  # ────────────────────────────── File Management Services ──────────────────────────────
  services.gvfs.enable = true;
  services.udisks2.enable = true;
}
