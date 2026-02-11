{ config, pkgs, ... }:

{
  #to allow ntfs drive to get mounted, otherwise error:
  boot.supportedFilesystems = [ "ntfs" ];

  #mount ssd
  fileSystems."/media/extras" = {
    device = "/dev/disk/by-uuid/552f4b63-8ba0-46b7-9054-a206402bc4f4";
    fsType = "ext4";
    options = [ "nofail" "x-systemd.device-timeout=5s" ];
  };

}
