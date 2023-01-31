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
        # 3 scaling is the max available in the settings UI
        NSGlobalDomain."com.apple.trackpad.scaling" = 3.0;
        ".GlobalPreferences"."com.apple.mouse.scaling" = "3";
        # Figure out how to setup spotlight to toggle indexing settings
        # defaults read com.apple.spotlight orderdItems
        # defaults write com.apple.spotlight orderedItems -array \
        # '{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'
    };
  };
  fonts.fontDir.enable = true; # DANGER
  fonts.fonts = [ (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];

  # backwards compat; don't change
  system.stateVersion = 4;
}
