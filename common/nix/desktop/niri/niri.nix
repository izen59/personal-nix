{ config, pkgs, lib, ... }:

{
  # ────────────────────────────── Compositor ──────────────────────────────
  programs.niri.enable = true;

  # XWayland support for legacy X11 apps
  programs.xwayland.enable = true;

  # ────────────────────────────── Authentication ──────────────────────────────
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  # PAM for swaylock (used across compositors)
  security.pam.services.swaylock = {};

  # ────────────────────────────── XDG Portals ──────────────────────────────
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk    # fallback/basic portal
      xdg-desktop-portal-gnome  # screencast + secret portal integration
    ];
    config.common.default = "gnome";
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
      "image/png" = [ "org.gnome.Photos.desktop" ];
      "image/jpeg" = [ "org.gnome.Photos.desktop" ];
      "image/webp" = [ "org.gnome.Photos.desktop" ];
      "image/gif" = [ "org.gnome.Photos.desktop" ];
      "image/svg+xml" = [ "org.gnome.Photos.desktop" ];
      "image/*" = [ "org.gnome.Photos.desktop" ];
      
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
    gnome-settings-daemon
    gsettings-desktop-schemas
    libdbusmenu-gtk3

    ## Wayland / Hyprland stack
    wayland-protocols 
    xdg-user-dirs 
    xorg.xhost

    ## Network & Bluetooth applets
    networkmanagerapplet 
    blueman

    ## File management / Desktop
    file-roller
    gnome-disk-utility
    nautilus
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
