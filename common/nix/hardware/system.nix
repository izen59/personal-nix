{ config, pkgs, inputs, user, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Important: defines compatibility with a specific NixOS release.
  # Do not change casually; bump only when upgrading across releases.
  system.stateVersion = "25.11";

  # Garbage collection
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";
  nix.settings.auto-optimise-store = true;
}
