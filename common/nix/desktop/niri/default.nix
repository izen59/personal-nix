{ config, inputs, user, ... }:

{
    imports = [
        ./niri.nix
        ./login/dms-greeter.nix
    ];


# Attach Niri Home Manager configs only when this desktop is active
  home-manager.users.${user}.imports = [
    ../../../home-manager/desktop/niri/default.nix
  ];
}
