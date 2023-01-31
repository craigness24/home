1. Install nixpkgs and brew
2. Clone this repo into .config/nixpkgs
3. `nix --extra-experimental-features "nix-command flakes" build .#darwinConfigurations.m1mbp.system`
4. Run result and then run the 2 commands shown to fix the errors and run again
```
% ./result/sw/bin/darwin-rebuild switch --flake ~/.config/nixpkgs
% printf 'run\tprivate/var/run\n' | sudo tee -a /etc/synthetic.conf
% /System/Library/Filesystems/apfs.fs/Contents/Resources/apfs.util -t 
% ./result/sw/bin/darwin-rebuild switch --flake ~/.config/nixpkgs
```
5. Reboot to make sure everything is as you expect when logging back in
6. Run nixswitch, see that you have a few errors, we want nix to control these so delete them:
```
> nixswitch
> sudo rm /etc/nix/nix.conf /etc/shells
> nixswitch
```



References:

https://github.com/zmre/mac-nix-simple-example

https://github.com/MatthiasBenaets/nixos-config
