{ inputs, config, pkgs, ... }:

{
  stylix = {
    enable = true;

    # Global dark preference
    polarity = "dark";

    # Color palette
    base16Scheme =
      "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  };
}
