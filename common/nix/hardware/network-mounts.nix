{ config, ... }:

{
  fileSystems."/mnt/samba-zoneminder" = {
    device = "//192.168.50.102/zoneminder";
    fsType = "cifs";
    options = [
      "username=sambazm"
      "password=sambazm"
      "uid=1000"
      "gid=100"
      "noatime"
      "x-systemd.automount"
      "x-systemd.idle-timeout=60"
    ];
  };

fileSystems."/mnt/nas-media" = {
  device = "192.168.50.101:/MEDIA";
  fsType = "nfs";
  options = [
    "_netdev"
    "noatime"
    "x-systemd.automount"
  ];
};

fileSystems."/mnt/nas-storage" = {
  device = "192.168.50.101:/STORAGE";
  fsType = "nfs";
  options = [
    "_netdev"
    "noatime"
    "x-systemd.automount"
  ];
};

fileSystems."/mnt/nas-audiobookshelf" = {
  device = "192.168.50.101:/AUDIOBOOKSHELF";
  fsType = "nfs";
  options = [
    "_netdev"
    "noatime"
    "x-systemd.automount"
  ];
};

fileSystems."/mnt/nas-komga" = {
  device = "192.168.50.101:/KOMGA";
  fsType = "nfs";
  options = [
    "_netdev"
    "noatime"
    "x-systemd.automount"
  ];
};

fileSystems."/mnt/nas-torrent" = {
  device = "192.168.50.101:/TORRENT";
  fsType = "nfs";
  options = [
    "_netdev"
    "noatime"
    "x-systemd.automount"
  ];
};

}
