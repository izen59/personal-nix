{ config, pkgs, lib, user, ... }:

{
  # Enable only the GDM login manager
  services.displayManager.gdm.enable = true;
  services.displayManager.gdm.wayland = true;

  # GDM needs the user's shell to be listed in /etc/shells
  environment.shells = with pkgs; [
    fish
    bashInteractive
  ];
}
