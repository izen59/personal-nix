{
  description = "Personal NixOS configs for Desktop + Toshiba laptop";

  inputs = {
    # ── Nixpkgs ─────────────────────────────────────────────────────────────
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url   = "github:nixos/nixpkgs/nixos-25.11";

    # ── Personal Packages ───────────────────────────────────────────────────
    personal-pkgs-nix.url = "github:izen67/personal-pkgs-nix";

    # ── Home Manager ────────────────────────────────────────────────────────
    home-manager.url = "github:nix-community/home-manager";

    # ── Stylix ──────────────────────────────────────────────────────────────
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # ── Noctalia ────────────────────────────────────────────────────────────
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = { self, nixpkgs-unstable, nixpkgs-stable, home-manager, stylix, personal-pkgs-nix, ... }@inputs:
  let
    globalOverlays = personal-pkgs-nix.overlays.x86_64-linux;
  in {
    nixosConfigurations = {

      # ──────────────────────────────── Main PC ────────────────────────────────
      pc = nixpkgs-unstable.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs personal-pkgs-nix;
          user = "pc";
        };
        modules = [
          ./common/default.nix
          ./hosts/pc/default.nix

          { nixpkgs.overlays = globalOverlays; }

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs;
              nixpkgs = nixpkgs-unstable;
            };
          }
        ];
      };

      # ──────────────────────────────── Gaming PC ────────────────────────────────
      gaming = nixpkgs-unstable.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs personal-pkgs-nix;
          user = "gaming";
        };
        modules = [
          ./common/default.nix
          ./hosts/gaming/default.nix

          { nixpkgs.overlays = globalOverlays; }

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs;
              nixpkgs = nixpkgs-unstable;
            };
          }
        ];
      };

      # ──────────────────────────────── TOSHIBA ─────────────────────────────
      toshiba = nixpkgs-stable.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs personal-pkgs-nix;
          user = "toshiba";
        };
        modules = [
          ./common/default.nix
          ./hosts/toshiba/default.nix

          { nixpkgs.overlays = globalOverlays; }

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs;
              nixpkgs = nixpkgs-stable;
            };
          }
        ];
      };

      # ──────────────────────────────── HP ────────────────────────────────
      hp = nixpkgs-stable.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs personal-pkgs-nix;
          user = "hp";
        };
        modules = [
          ./common/default.nix
          ./hosts/hp/default.nix

          { nixpkgs.overlays = globalOverlays; }

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs;
              nixpkgs = nixpkgs-stable;
            };
          }
        ];
      };

    };
  };
}
