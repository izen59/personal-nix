{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;

      format = "$time$cmd_duration$username[](fg:accent bg:surface2)$directory[](fg:surface2 bg:surface3)$git_branch$git_status[](fg:surface3)$character";

      time = {
        disabled = false;
        time_format = "%R";
        format = "[ $time ](fg:accent bg:surface)";
      };

      cmd_duration = {
        min_time = 3000;
        format = "[ $duration ](fg:accent bg:surface)";
      };

      username = {
        format = "[$user ](fg:accent bg:surface)";
      };

      directory = {
        truncation_length = 3;
        format = "[ $path ](fg:text bg:surface2)";
        home_symbol = "~";
      };

      git_branch = {
        format = "[ $branch(:$remote_branch) ](fg:text bg:surface3)";
      };

      git_status = {
        format = "[$all_status ](fg:accent_soft bg:surface3)";
      };

      character = {
        success_symbol = "[❯](fg:accent)";
        error_symbol   = "[✗](fg:warn)";
      };
    };
  };
}
