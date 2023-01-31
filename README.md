1. Install nixpkgs and brew
2. Clone this repo into .config/nixpkgs
3. `nix --extra-experimental-features "nix-command flakes" build .#darwinConfigurations.m1mbp.system`



References:
https://github.com/zmre/mac-nix-simple-example
https://github.com/MatthiasBenaets/nixos-config
