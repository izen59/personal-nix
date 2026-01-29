{ config, pkgs, lib, user, ... }:

{
  # ────────────────────────────── Compositor ──────────────────────────────
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
    systemd.setPath.enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  # ────────────────────────────── Authentication ──────────────────────────────
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  # PAM for swaylock (used across compositors)
  security.pam.services.swaylock = {};

  # ────────────────────────────── XDG Portals ──────────────────────────────
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
    config.common.default = "hyprland";
  };

  # ────────────────────────────── MIME Defaults ──────────────────────────────
  xdg.mime = {
    enable = true;
    defaultApplications = {
      # File manager
      "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
      "x-directory/normal" = [ "org.gnome.Nautilus.desktop" ];
  
      # Text and scripts
      "text/plain" = [ "org.kde.kate.desktop" ];
      "application/x-shellscript" = [ "org.kde.kate.desktop" ];
  
      # Terminal integration (required for Nemo)
      "application/x-terminal-emulator" = [ "kitty.desktop" ];
      "x-scheme-handler/terminal" = [ "kitty.desktop" ];
  
      # Images
      "image/png" = [ "org.gnome.Loupe.desktop" ];
      "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
      "image/webp" = [ "org.gnome.Loupe.desktop" ];
      "image/gif" = [ "org.gnome.Loupe.desktop" ];
      "image/svg+xml" = [ "org.gnome.Loupe.desktop" ];
      "image/*" = [ "org.gnome.Loupe.desktop" ];
      
      # Video
      "video/mp4" = [ "vlc.desktop" ];
      "video/x-matroska" = [ "vlc.desktop" ];
      "video/webm" = [ "vlc.desktop" ];
      "video/quicktime" = [ "vlc.desktop" ];
      "video/*" = [ "vlc.desktop" ];
      
      # Audio
      "audio/mpeg" = [ "vlc.desktop" ];
      "audio/flac" = [ "vlc.desktop" ];
      "audio/ogg" = [ "vlc.desktop" ];
      "audio/wav" = [ "vlc.desktop" ];
      "audio/x-m4a" = [ "vlc.desktop" ];
      "audio/aac" = [ "vlc.desktop" ];
      "audio/*" = [ "vlc.desktop" ];
    };
  };

  # ────────────────────────────── System Packages ──────────────────────────────
  environment.systemPackages = with pkgs; [

    ## Core tools
    axel 
    bc 
    ripgrep 
    libqalculate 
    libnotify
    playerctl 
    brightnessctl 
    ddcutil
    wireplumber 
    networkmanager 
    easyeffects
    wl-clipboard 
    wf-recorder 
    mpv 
    cliphist 
    ydotool 
    gnome-settings-daemon
    libdbusmenu-gtk3
    nwg-look

    ## Wayland / Hyprland stack
    wayland-protocols 
    xdg-user-dirs 
    xorg.xhost

    ## Network & Bluetooth applets
    networkmanagerapplet 
    blueman

    ## File management / Desktop
    gnome-disk-utility
    file-roller
    nautilus
    xviewer
  ];

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };

  # ────────────────────────────── Fonts ────────────────────────────── 
  fonts.fontconfig.enable = true;
  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [
    material-symbols 
    rubik
    nerd-fonts.jetbrains-mono 
    nerd-fonts.ubuntu 
    nerd-fonts.ubuntu-mono
    nerd-fonts.caskaydia-cove 
    nerd-fonts.fantasque-sans-mono
    nerd-fonts.mononoki 
    nerd-fonts.space-mono
    maple-mono.Normal-NF
  ];

  # ────────────────────────────── File Management Services ──────────────────────────────
  services.gvfs.enable = true;
  services.udisks2.enable = true;
}
