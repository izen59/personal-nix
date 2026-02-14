{
  description = "Personal NixOS configs";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url   = "github:nixos/nixpkgs/nixos-25.11";

    personal-pkgs-nix.url = "github:izen67/personal-pkgs-nix";

    home-manager.url = "github:nix-community/home-manager";
    stylix.url = "github:nix-community/stylix";
  };

  outputs = { self, nixpkgs-stable, nixpkgs-unstable, home-manager, stylix, personal-pkgs-nix, ... }@inputs:
  let
    system = "x86_64-linux";
    globalOverlays = personal-pkgs-nix.overlays.x86_64-linux;

    mkPkgs = nixpkgs: import nixpkgs {
      inherit system;
      overlays = globalOverlays;
      config = {
        allowUnfree = true;
      };
    };

    mkHost = { hostname, nixpkgs, user }:
      nixpkgs.lib.nixosSystem {
        inherit system;

        pkgs = mkPkgs nixpkgs;

        specialArgs = {
          inherit inputs personal-pkgs-nix user;
        };

        modules = [
          ./common/default.nix
          ./hosts/${hostname}/default.nix

          # Desktop chosen here:
          ./common/nix/desktop/${desktop}/default.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
          }

          stylix.nixosModules.stylix
        ];
      };
  in
  {
    nixosConfigurations = {
    # Niri and Hyprland should be only on unstable due to DMS only being available on unstable.
      pc = mkHost {
        hostname = "pc";
        nixpkgs = nixpkgs-stable;
        user = "pc";
        desktop = "gnome";
      };

      toshiba = mkHost {
        hostname = "toshiba";
        nixpkgs = nixpkgs-stable;
        user = "toshiba";
        desktop = "gnome";
      };

      hp = mkHost {
        hostname = "hp";
        nixpkgs = nixpkgs-stable;
        user = "hp";
        desktop = "gnome";
      };

      gaming = mkHost {
        hostname = "gaming";
        nixpkgs = nixpkgs-unstable;
        user = "gaming";
        desktop = "niri";
      };
    };
  };
}
