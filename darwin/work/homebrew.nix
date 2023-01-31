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
      "microsoft-teams"
      "microsoft-outlook"
    ];
    taps = [ "mongodb/brew" ];
    brews = [ 
      {
        name = "mongodb-community"; 
        restart_service = "changed";
      }
      {
        name = "nats-server";
        restart_service = "changed";
      }
    ];
  };
}
