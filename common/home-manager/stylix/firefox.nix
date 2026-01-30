{ ... }:

{
  stylix.targets.firefox = {
    enable = true;

    profileNames = [ "mainprofile" ];

    colors.enable = true;
    fonts.enable = true;
    inputs.enable = true;

    # Optional: GNOME look
    firefoxGnomeTheme.enable = false;

    # Optional: Firefox Color extension theme
    colorTheme.enable = false;
  };
}
