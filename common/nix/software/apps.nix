{ config, pkgs, ... }:

{
  services.flatpak.enable = true;
  environment.systemPackages = with pkgs; [
    # Networking Tools
    wget
    curl
    nmap
    inetutils
    dnsutils
    cifs-utils
    nfs-utils

    # Filesystem & Storage Utilities 
    ntfs3g
    exfat
    exfatprogs
    unrar
    usbutils
    pciutils
    gnome-disk-utility
    smartmontools
    gsmartcontrol
    parted

    # System & CLI Utilities
    git
    iw
    tree
    jq
    nvtopPackages.amd
    btop
    gnupg
    openssl
    eza
    lm_sensors
    exiftool
    glib
    mpv
    vlc
    kdePackages.kate

    # Multimedia / Audio Tools
    pavucontrol
    ffmpeg-full
  ];

  fonts = {
    fontconfig.enable = true;
    packages = with pkgs; [
      font-awesome
    ];
  };

  # Terminal defaults
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
}
