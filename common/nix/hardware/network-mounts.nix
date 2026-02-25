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

fileSystems."/mnt/samba-media" = {
  device = "//192.168.50.102/MEDIA";
  fsType = "nfs";
  options = [
    "_netdev"
    "noatime"
    "x-systemd.automount"
    "x-systemd.idle-timeout=60"
  ];
};

fileSystems."/mnt/samba-storage" = {
  device = "//192.168.50.102/STORAGE";
  fsType = "nfs";
  options = [
    "_netdev"
    "noatime"
    "x-systemd.automount"
    "x-systemd.idle-timeout=60"
  ];
};

fileSystems."/mnt/samba-torrent" = {
  device = //192.168.50.102/TORRENT";
  fsType = "nfs";
  options = [
    "_netdev"
    "noatime"
    "x-systemd.automount"
    "x-systemd.idle-timeout=60"
  ];
};

}
