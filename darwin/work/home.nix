{ pkgs, ... }: {
  # Don't change this when you change package input. Leave it alone.
  home.stateVersion = "22.11";
  # specify my home-manager configs
  home.packages = with pkgs; [
    ripgrep
    fd
    curl
    less
    htop
    kubectl
    kubernetes-helm
    awscli2
    azure-cli
    docker
    colima
    mongodb
    mongodb-tools
    mongosh
    nats-server
  ];
  home.sessionVariables = {
    PAGER = "less";
    CLICLOLOR = 1;
    EDITOR = "vi";

    # Allow test container support using colima
    TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE = /var/run/docker.sock;
    DOCKER_HOST = "unix://$HOME/.colima/docker.sock";
  };
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
#  programs.neovim = {
#    enable = true;
#  };
  programs.bat.enable = true;
  programs.bat.config.theme = "TwoDark";
  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;
  programs.exa.enable = true;
  programs.git = {
    enable = true;
    userName  = "Craig Adams";
    userEmail = "craigness24@gmail.com";
  };
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.enableAutosuggestions = true;
  programs.zsh.enableSyntaxHighlighting = true;
  programs.zsh.shellAliases = {
    ls = "ls --color=auto -F";
    ll = "ls -lhtr";
    k = "kubectl";
    devstart = "make --file=~/.config/nixpkgs/darwin/work/Makefile start";
    devstop = "make --file=~/.config/nixpkgs/darwin/work/Makefile stop";
    nixswitch = "darwin-rebuild switch --flake ~/.config/nixpkgs/.#";
    nixup = "pushd ~/.config/nixpkgs; nix flake update; nixswitch; popd";
  };
  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;
  programs.starship.settings = {
    kubernetes = {
      disabled = false;
    }; 
  };

  home.file.".config/kitty".source = ./dotfiles/kitty;
}
