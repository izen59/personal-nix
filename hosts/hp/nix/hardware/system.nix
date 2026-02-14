{ config, pkgs, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Use LTS kernel.
  boot.kernelPackages = pkgs.linuxPackages;

  # Laptop Stuff
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
  powerManagement.enable = true;
  services.thermald.enable = true;
}
