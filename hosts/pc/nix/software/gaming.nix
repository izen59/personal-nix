{ config, pkgs, ... }:

{
  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  environment.systemPackages = with pkgs; [
    wineWow64Packages.unstable
    winetricks
    mangohud
    goverlay
    protonplus
    lutris
    prismlauncher
  ];

  environment.sessionVariables = {
    # Steam custom Proton paths
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
