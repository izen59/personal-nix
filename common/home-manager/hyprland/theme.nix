{ config, pkgs, ... }:

{
  # ───── GTK ─────
  gtk = {
    enable = true;
    colorScheme = "dark";

    theme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-gtk-theme;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Classic";
      size = 24;
      package = pkgs.bibata-cursors;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  # ───── Qt follows GTK ─────
  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };

  # ───── Environment ─────
  home.sessionVariables = {
    GTK_THEME = "Colloid-Dark";
    QT_QPA_PLATFORMTHEME = "gtk3";
  };

  # ───── Cursor (X11/Wayland fallback) ─────
  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    size = 24;
    package = pkgs.bibata-cursors;
    gtk.enable = false;
    x11.enable = true;
  };
}
