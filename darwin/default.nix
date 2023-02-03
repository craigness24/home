{ lib, inputs, nixpkgs, home-manager, darwin, ...}:

let
  system = "aarch64-darwin";
in
{
  m1mbp = darwin.lib.darwinSystem {
    inherit system;
    pkgs = import nixpkgs { system = system; };
    specialArgs = { inherit inputs; };
    modules = [
      ./configuration.nix
      ./m1mbp/homebrew.nix

      home-manager.darwinModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { };
        home-manager.users.craig = import ./m1mbp/home.nix;
      }
    ];
  };
  work = darwin.lib.darwinSystem {
    inherit system;
    pkgs = import nixpkgs { system = system; config.allowUnfree = true; };
    
    specialArgs = { inherit inputs; };
    modules = [
      ./configuration.nix
      ./work/homebrew.nix

      home-manager.darwinModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { };
        home-manager.users.cadams = import ./work/home.nix;
      }
    ];
  };
}
