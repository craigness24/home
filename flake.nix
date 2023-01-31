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
  outputs = inputs@{ nixpkgs, home-manager, darwin, ... }:
    let
        tmp = "craig";
    in
    {
    darwinConfigurations = (
        import ./darwin {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager darwin;
        }
     );
  };
}
