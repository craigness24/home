{ lib, inputs, nixpkgs, home-manager, darwin, user, ...}:

let
  system = "aarch64-darwin";
in
{
  m1mbp = darwin.lib.darwinSystem {
    inherit system;
    pkgs = import nixpkgs { system = system; };
    specialArgs = { inherit user inputs; };
    modules = [
      ./configuration.nix
      ./m1mbp/homebrew.nix

      home-manager.darwinModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit user; };
        home-manager.users.${user} = import ./m1mbp/home.nix;
      }
    ];
  };
  work = darwin.lib.darwinSystem {
    inherit system;
    pkgs = import nixpkgs { system = system; };
    specialArgs = { inherit user inputs; };
    modules = [
      ./configuration.nix
      ./work/homebrew.nix

      home-manager.darwinModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit user; };
        home-manager.users.${user} = import ./work/home.nix;
      }
    ];
  };
}
