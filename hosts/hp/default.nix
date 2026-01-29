{ config, inputs, user,... }:

{
  imports = [
    ./hardware-configuration.nix

    ./nix/software/apps.nix


    ./nix/hardware/network.nix
    ./nix/hardware/system.nix


     ../../common/nix/desktop/gnome/default.nix
  ];

  # Attach PC-specific Home Manager files
  home-manager.users.${user}.imports = [
    ./home-manager/default.nix
  ];
}
