{ config, pkgs, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Switch to official latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Disable TPM (not working in dell)
  security.tpm2.enable = false;
  services.tpm2-abrmd.enable = false;

  # Limits to prevent system crashes and ease up on the CPU while building
  nix.settings = {
    max-jobs = 1;
    cores = 4;
  };
}
