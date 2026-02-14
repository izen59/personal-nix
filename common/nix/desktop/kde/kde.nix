{ config, pkgs, lib, user, ... }:

{
  # Plasma 6
  services.desktopManager.plasma6.enable = true;
  programs.xwayland.enable = true;

  # Useful KDE config module (System Settings -> Login Screen etc.)
  environment.systemPackages = with pkgs; [
    kdePackages.sddm-kcm
  ];

  # Custom terminal preference
  environment.etc."xdg/kdeglobals".text = ''
    [General]
    TerminalApplication=kitty
    TerminalService=kitty.desktop
  '';
}
