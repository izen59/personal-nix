{ config, ... }:

{
  fileSystems."/mnt/sambazm" = {
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

  fileSystems."/mnt" = {
    device = "192.168.50.101:/MEDIA";
    fsType = "nfs";
    options = [
      "_netdev"
      "noatime"
      "x-systemd.automount"
    ];
  };

  fileSystems."/mnt" = {
    device = "192.168.50.101:/FILEBROWSER";
    fsType = "nfs";
    options = [
      "_netdev"
      "noatime"
      "x-systemd.automount"
    ];
  };

  fileSystems."/mnt" = {
    device = "192.168.50.101:/AUDIOBOOKSHELF";
    fsType = "nfs";
    options = [
      "_netdev"
      "noatime"
      "x-systemd.automount"
    ];
  };

}
