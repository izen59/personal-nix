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

  # Sets monitor config to be as same as desktop
  systemd.services.gdm-monitors = {
    description = "Sync GNOME monitors.xml to GDM";
    wantedBy = [ "display-manager.service" ];
    before = [ "display-manager.service" ];

    serviceConfig = {
      Type = "oneshot";
      ConditionPathExists = "/home/${user}/.config/monitors.xml";
      ExecStart = "${pkgs.coreutils}/bin/cp -f /home/${user}/.config/monitors.xml /etc/xdg/monitors.xml";
      ExecStartPost = "${pkgs.coreutils}/bin/chmod 0644 /etc/xdg/monitors.xml";
    };
}
