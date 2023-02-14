{ config, pkgs, lib, ... }: {
  homebrew = {
    enable = true;
    global.brewfile = true;
    onActivation = {
      # "zap" removes manually installed brews and casks
      cleanup = "zap";
    };
    masApps = {};
    caskArgs.no_quarantine = true;
    casks = [
      "kitty"
      "intellij-idea"
      "rider"
      "pycharm"
      "webstorm" 
      "brave-browser"
      "slack"
      "mongodb-compass"
      "altair-graphql-client"
      "microsoft-teams"
      "microsoft-outlook"
      "keeper-password-manager"
    ];
    taps = [];
    brews = [];
  };
}
