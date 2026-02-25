{ config, ... }:

{
  fileSystems."/mnt/samba-zoneminder" = {
    device = "//192.168.50.102/zoneminder";
    fsType = "cifs";
    options = [
      "_netdev"
      "noatime"
      "x-systemd.automount"
      "x-systemd.idle-timeout=60"
    ];
  };

}
