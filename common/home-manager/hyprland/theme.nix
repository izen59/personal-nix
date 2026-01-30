{ config, pkgs, lib, ... }:

{
  # ───── Global dark preference (libadwaita / GNOME) ─────
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  # ───── GTK ─────
  gtk = {
    enable = true;
    colorScheme = "dark";

    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
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
  };

  # ───── Qt (native Adwaita bridge) ─────
  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style.name = "adwaita-dark";
  };

  # ───── Export dark GTK preference to session ─────
  home.sessionVariables = {
    GTK_THEME = "Adwaita:dark";
  };

  # Make sure graphical apps see env vars
  #systemd.user.sessionVariables = config.home.sessionVariables;

  # ───── KDE apps default dark scheme ─────
  xdg.configFile."kdeglobals".text = ''
[General]
ColorScheme=BreezeDark
Name=BreezeDark
'';

  # ───── Cursor fallback ─────
  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    size = 24;
    package = pkgs.bibata-cursors;
    gtk.enable = false;
    x11.enable = true;
  };
}
