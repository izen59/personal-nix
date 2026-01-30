{ ... }:

{
  stylix.targets.gtk = {
    enable = true;

    # Ensure GTK uses Stylix color palette
    colors.enable = true;

    # Fonts come from stylix/fonts.nix
    fonts.enable = true;

    # Theme Flatpak GTK apps
    flatpakSupport.enable = true;
  };
}
