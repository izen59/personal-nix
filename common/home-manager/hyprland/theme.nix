{ config, pkgs, ... }:

{
  gtk = {
    enable = true;

    # GTK4 / libadwaita: dark mode ONLY
    colorScheme = "dark";

    # GTK3 only
    theme = {
      name = "Colloid";
      package = pkgs.colloid-gtk-theme;
    };

    iconTheme = {
      name = "Colloid";
      package = pkgs.colloid-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Classic";
      size = 24;
      package = pkgs.bibata-cursors;
    };
  };
  
  qt = {
    enable = true;
  
    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
  
    kde.settings = {
      kdeglobals = {
        General = {
          ColorScheme = "BreezeDark";
        };
  
        Icons = {
          Theme = "Papirus-Dark";
        };
      };
    };
  };

  # dconf is used only for settings not fully abstracted by HM
  # and for non-GTK consumers (portals, Electron, Qt integration)
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  # Cursor for non-GTK consumers (XWayland, misc toolkits)
  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    size = 24;
    package = pkgs.bibata-cursors;
    gtk.enable = false;
    x11.enable = true;
  };

  home.packages = with pkgs; [
    kdePackages.breeze
  ];
}
