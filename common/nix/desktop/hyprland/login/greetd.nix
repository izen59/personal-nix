{ config, pkgs, lib, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --remember --asterisks --no-xsession-wrapper --cmd start-hyprland";
        user = "greeter";
      };
    };
  };

  # Add this line to enable gnome-keyring unlock via PAM
  security.pam.services.greetd.enableGnomeKeyring = true;

  services.displayManager.sessionPackages = [ pkgs.hyprland ];

  systemd = {
    settings.Manager.DefaultTimeoutStopSec = "10s";
    services.greetd.serviceConfig = {
      Type = "idle";
      StandardInput = "tty";
      StandardOutput = "tty";
      StandardError = "journal";
      TTYReset = true;
      TTYVHangup = true;
      TTYVTDisallocate = true;
    };
  };
}
