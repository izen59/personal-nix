{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = false;
    enableGitIntegration = false;         # optional
    shellIntegration.enableFishIntegration = true;

    settings = {
      cursor_shape = "beam";
      cursor_trail = 1;
      window_margin_width = 21.75;
      confirm_os_window_close = 0;
      shell = "fish";
    };

    keybindings = {
      # Copy
      "ctrl+c" = "copy_or_interrupt";

      # Scroll
      "page_up"   = "scroll_page_up";
      "page_down" = "scroll_page_down";

      # Zoom
      "ctrl+plus"        = "change_font_size all +1";
      "ctrl+equal"       = "change_font_size all +1";
      "ctrl+kp_add"      = "change_font_size all +1";
      "ctrl+minus"       = "change_font_size all -1";
      "ctrl+underscore"  = "change_font_size all -1";
      "ctrl+kp_subtract" = "change_font_size all -1";
      "ctrl+0"           = "change_font_size all 0";
      "ctrl+kp_0"        = "change_font_size all 0";
    };

    # Any additional raw config lines can go here
    extraConfig = ''
      # Consistent padding with foot
      # window_margin_width 21.75
    '';

    # Custom kittens
    environment = { }; # define env vars if needed
  };

}
