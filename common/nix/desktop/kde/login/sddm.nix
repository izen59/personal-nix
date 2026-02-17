{ config, pkgs, user, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland = {
      enable = true;
      compositor = "kwin";
    };
    theme = "breeze";
    autoNumlock = true;
    #enableHidpi = true;
  };

  environment.systemPackages = [
    (pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
      [General]
      background=${../../../../../assets/wallpaper5.png}
    '')
  ];

  # Sets monitor config to be the same as desktop
  systemd.services.sddm-plasma-config = {
    description = "Sync Plasma display/input config to SDDM";
    wantedBy = [ "display-manager.service" ];
    before = [ "display-manager.service" ];

    serviceConfig = {
      Type = "oneshot";

      ExecStart = "${pkgs.bash}/bin/bash -c ''
        set -e

        mkdir -p /var/lib/sddm/.config

        if [ -f /home/${user}/.config/kwinoutputconfig.json ]; then
          ${pkgs.coreutils}/bin/cp -f /home/${user}/.config/kwinoutputconfig.json /var/lib/sddm/.config/
          ${pkgs.coreutils}/bin/chown sddm:sddm /var/lib/sddm/.config/kwinoutputconfig.json
          ${pkgs.coreutils}/bin/chmod 0644 /var/lib/sddm/.config/kwinoutputconfig.json
        fi

        if [ -f /home/${user}/.config/kcminputrc ]; then
          ${pkgs.coreutils}/bin/cp -f /home/${user}/.config/kcminputrc /var/lib/sddm/.config/
          ${pkgs.coreutils}/bin/chown sddm:sddm /var/lib/sddm/.config/kcminputrc
          ${pkgs.coreutils}/bin/chmod 0644 /var/lib/sddm/.config/kcminputrc
        fi
      ''";
    };
  };
}
