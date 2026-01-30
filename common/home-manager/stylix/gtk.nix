{ ... }:

{
  stylix.targets.gtk = {
    enable = true;

    # Use Stylix palette + fonts
    colors.enable = true;
    fonts.enable = true;

    # Theme Flatpak GTK apps
    flatpakSupport.enable = true;
  };
}
