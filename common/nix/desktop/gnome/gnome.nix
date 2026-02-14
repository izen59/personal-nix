{ config, pkgs, lib, user, ... }:

{
  services.desktopManager.gnome.enable = true;
  programs.xwayland.enable = true;

  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnome-browser-connector

    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.vitals
  ];

  # Optional: strip GNOME default apps
  # services.gnome.core-apps.enable = false;
  # environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs ];
}
