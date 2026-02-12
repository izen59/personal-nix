{ config, pkgs, lib, user, ... }:

{
  programs.dms-shell = {
    enable = true;

    #### Features (safe defaults)
    enableDynamicTheming = true;
    enableClipboardPaste = true;
    enableCalendarEvents = true;
    enableAudioWavelength = true;
    enableSystemMonitoring = true;

    # VPN toggle support (only enable if you actually use it)
    enableVPN = false;

    #### Run as a systemd user service (recommended on Niri)
    systemd = {
      enable = true;
      target = "graphical-session.target";

      restartIfChanged = true;
    };

    #### Plugins
    # Keep empty until you actually add plugins
    plugins = { };
  };
}
