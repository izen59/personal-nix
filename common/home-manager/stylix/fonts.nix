{ pkgs, ... }:

{
  # Global font definitions
  stylix.fonts = {
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
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };

    sizes = {
      applications = 11;
      terminal = 12;
      desktop = 11;
      popups = 11;
    };
  };

  # Install font packages system-wide
  stylix.targets.font-packages = {
    enable = true;
    fonts.enable = true;
  };

  # Make fontconfig respect stylix fonts
  stylix.targets.fontconfig = {
    enable = true;
    fonts.enable = true;
  };
}
