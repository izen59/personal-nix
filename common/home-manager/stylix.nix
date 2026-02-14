{ inputs, pkgs, ... }:

{
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  stylix = {
    enable = true;

    # Disable this werid x11 shit that caused building errors.
    stylix.targets.xresources = {
      enable = false;
      colors.enable = false;
      fonts.enable = false;
    };

    # Enable most targets automatically
    autoEnable = true;

    # Force dark mode
    polarity = "dark";

    # Color palette
    base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa-dragon.yaml";
    #image = ../../assets/wallpaper4.png;

    # Icons
    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus";
    };

    # Cursor
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };

    # Fonts
    fonts = {
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };

      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        applications = 11;
        desktop = 11;
        terminal = 12;
        popups = 11;
      };
    };

    # Subtle terminal transparency
    opacity = {
      terminal = 0.95;
      applications = 1.0;
      desktop = 1.0;
      popups = 1.0;
    };

    # Per app settings:
    targets.firefox = {
      profileNames = [ "mainprofile" ];
      fonts.enable = false;
    };

  };
}
