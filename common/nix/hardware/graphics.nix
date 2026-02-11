{ config, pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      libva      # VA-API base
      intel-media-driver      # Intel VA-API driver (modern, Gen8+)
      intel-vaapi-driver      # Optional: older Intel fallback (harmless on AMD)
    ];

    extraPackages32 = with pkgs.pkgsi686Linux; [
      libva
    ];
  };

  environment.systemPackages = with pkgs; [
    libva-utils
    mesa-demos
    vulkan-tools
  ];
}
