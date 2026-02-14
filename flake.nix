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

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }

          stylix.nixosModules.stylix
        ];
      };
  in
  {
    nixosConfigurations = {
      pc = mkHost {
        hostname = "pc";
        nixpkgs = nixpkgs-unstable;
        user = "pc";
      };

      toshiba = mkHost {
        hostname = "toshiba";
        nixpkgs = nixpkgs-stable;
        user = "toshiba";
      };

      hp = mkHost {
        hostname = "hp";
        nixpkgs = nixpkgs-stable;
        user = "hp";
      };

      gaming = mkHost {
        hostname = "gaming";
        nixpkgs = nixpkgs-unstable;
        user = "gaming";
      };
    };
  };
}
