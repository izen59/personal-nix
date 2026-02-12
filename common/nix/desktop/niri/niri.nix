{ config, pkgs, lib, ... }:

{
  # ────────────────────────────── Compositor ──────────────────────────────
  programs.niri.enable = true;

  # XWayland support for legacy X11 apps
  programs.xwayland.enable = true;

  # ────────────────────────────── Authentication ──────────────────────────────
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  systemd.user.services.gnome-keyring-secrets = {
    description = "GNOME Keyring (secrets)";
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.gnome-keyring}/bin/gnome-keyring-daemon --start --components=secrets";
      Restart = "on-failure";
    };
  };

  # ────────────────────────────── XDG Portals ──────────────────────────────
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome  # screencast + secret portal integration
      xdg-desktop-portal-gtk    # fallback/basic portal
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
      "image/png" = [ "org.nomacs.ImageLounge" ];
      "image/jpeg" = [ "org.nomacs.ImageLounge" ];
      "image/webp" = [ "org.nomacs.ImageLounge" ];
      "image/gif" = [ "org.nomacs.ImageLounge" ];
      "image/svg+xml" = [ "org.nomacs.ImageLounge" ];
      "image/*" = [ "org.nomacs.ImageLounge" ];
      
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
    mpv
    gnome-settings-daemon
    gsettings-desktop-schemas
    libdbusmenu-gtk3

    ## Wayland / Niri stack
    wayland-protocols 
    xdg-user-dirs
    polkit_gnome

    ## File management / Desktop
    file-roller
    gnome-disk-utility
    nautilus
    nomacs
  ];

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };

  # Start the polkit agent
  systemd.user.services.polkit-gnome-agent = {
    description = "Polkit GNOME Authentication Agent";
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
    };
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
