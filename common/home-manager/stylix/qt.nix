{ ... }:

{
  stylix.targets.qt = {
    enable = true;

    # Most stable backend outside KDE
    platform = "qtct";

    # Wayland-friendly dialogs
    standardDialogs = "xdgdesktopportal";
  };
}
