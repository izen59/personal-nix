{ inputs, config, pkgs, ... }:

{
  stylix = {
    enable = true;

    # Global dark preference
    polarity = "dark";

    # Color palette (no wallpaper required)
    base16Scheme =
      "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  };
}
