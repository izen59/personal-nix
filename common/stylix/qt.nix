{ ... }:

{
  stylix.targets.qt = {
    enable = true;

    # Most stable backend outside KDE
    platform = "qtct";

    # Use native portal dialogs (Wayland friendly)
    standardDialogs = "xdgdesktopportal";
  };
}
