{ config, ... }:

{
  fileSystems."/media/sambazm" = {
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

fileSystems."/media/media" = {
  device = "192.168.50.101:/MEDIA";
  fsType = "nfs";
  options = [
    "_netdev"
    "noatime"
    "x-systemd.automount"
  ];
};

fileSystems."/media/storage" = {
  device = "192.168.50.101:/STORAGE";
  fsType = "nfs";
  options = [
    "_netdev"
    "noatime"
    "x-systemd.automount"
  ];
};

fileSystems."/media/audiobookshelf" = {
  device = "192.168.50.101:/AUDIOBOOKSHELF";
  fsType = "nfs";
  options = [
    "_netdev"
    "noatime"
    "x-systemd.automount"
  ];
};

fileSystems."/media/komga" = {
  device = "192.168.50.101:/KOMGA";
  fsType = "nfs";
  options = [
    "_netdev"
    "noatime"
    "x-systemd.automount"
  ];
};

fileSystems."/media/torrent" = {
  device = "192.168.50.101:/TORRENT";
  fsType = "nfs";
  options = [
    "_netdev"
    "noatime"
    "x-systemd.automount"
  ];
};

}
