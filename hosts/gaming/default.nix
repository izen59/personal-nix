{ config, inputs, user, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./nix/software/apps.nix
    ./nix/software/gaming.nix
    ./nix/software/vms.nix
    #./nix/software/ollama.nix


    ./nix/hardware/mounts.nix
    ./nix/hardware/network.nix
    ./nix/hardware/system.nix
  ];

  # Attach PC-specific Home Manager files
  home-manager.users.${user}.imports = [
    ./home-manager/default.nix
  ];
}
