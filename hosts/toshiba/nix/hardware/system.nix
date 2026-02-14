{ config, pkgs, ... }:

{
  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  # Use LTS kernel.
  boot.kernelPackages = pkgs.linuxPackages;

  # Laptop Stuff
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
  powerManagement.enable = true;
  services.thermald.enable = true;
}
