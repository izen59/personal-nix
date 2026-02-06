{ pkgs, user, ... }:

{
  services.linux-wallpaperengine = {
    enable = true;

    assetsPath =
      "/media/extras/SteamLibrary/steamapps/common/wallpaper_engine/assets";

    wallpapers = [
      {
        monitor = "HDMI-A-1";

        wallpaperId =
          "/media/extras/SteamLibrary/steamapps/workshop/content/431960/2954922038";

        fps = 30;
        scaling = "fill";

        audio = {
          silent = true;
          automute = true;
          processing = false;
        };
      }

      {
        monitor = "DP-1";

        wallpaperId =
          "/media/extras/SteamLibrary/steamapps/workshop/content/431960/2954922038";
      }
    ];
  };
}
