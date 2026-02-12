{ config, pkgs, lib, user, ... }:

{
  services.displayManager.dms-greeter = {
    enable = true;

    compositor = {
      name = "hyprland";
    };

    #### copy your DMS config into the greeter cache so the greeter has your wallpaper/theme/session settings.
    configHome = "/home/${user}";
    
    #### Logs are extremely useful for debugging early boot issues
    logs = {
      save = true;
      path = "/tmp/dms-greeter.log";
    };
  };

  security.pam.services.greetd.enableGnomeKeyring = true;

  #### Optional: greetd stability tweaks (only needed if you get TTY hangs)
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
