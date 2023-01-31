{ pkgs, ... }: {
  # here go the darwin preferences and config items
  programs.zsh.enable = true;
  environment = {
    shells = with pkgs; [ bash zsh ];
    loginShell = pkgs.zsh;
    systemPackages = [ pkgs.coreutils ];
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };
  services.nix-daemon.enable = true;
  nix = {
    package = pkgs.nix;
    gc = {
      automatic = true;
      interval.Day = 7;
      options = "--delete-older-than 7d";
    };
    extraOptions = ''
      auto-optimise-store = true
      experimental-features = nix-command flakes
    '';
  };
  system = {
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
    defaults = {
        finder.AppleShowAllExtensions = true;
        dock.autohide = true;
        NSGlobalDomain.AppleShowAllExtensions = false;
        NSGlobalDomain.InitialKeyRepeat = 14;
        NSGlobalDomain.KeyRepeat = 1;
    };
  };
  fonts.fontDir.enable = true; # DANGER
  fonts.fonts = [ (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];

  # backwards compat; don't change
  system.stateVersion = 4;
}