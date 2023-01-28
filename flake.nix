{
  description = "Craig's homelab flake";
  inputs = {
    # Where we get most of our software. Giant mono repo with recipes
    # called derivations that say how to build software.
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-22.11-darwin"; 

    # Manages configs links things into your home directory
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Controls system level software and settings including fonts
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs@{ nixpkgs, home-manager, darwin, ... }: {
    darwinConfigurations = { 
      m1mbp = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        pkgs = import nixpkgs { system = "aarch64-darwin"; };
        modules = [
          ./modules/darwin
          ./modules/darwin/homebrew.nix
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              users.craig.imports = [ ./modules/home-manager ];
          };
        }
      ];
    };
  };
  };
}
