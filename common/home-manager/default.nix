{ inputs, user, ... }:

{
  home-manager = {
    # Let Home Manager see flake inputs and user
    extraSpecialArgs = { inherit inputs user; };

    # Attach your user config
    users.${user} = import ./home-manager.nix;

    # Keep backups of replaced files
    backupFileExtension = "backup";
  };
}
