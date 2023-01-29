{ config, pkgs, lib, ... }: {
  homebrew = {
    enable = true;
    global.brewfile = true;
    onActivation = {
      # "zap" removes manually installed brews and casks
      cleanup = "zap";
    };
    masApps = {};
    brews = [];
    caskArgs.no_quarantine = true;
    casks = [
      "amethyst"
      "kitty"
      "intellij-idea"
      "brave-browser"
    ];
    taps = [];
  };
}
