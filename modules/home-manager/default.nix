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
  ];
  home.sessionVariables = {
    PAGER = "less";
    CLICLOLOR = 1;
#    EDITOR = "nvim";
  };
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
  programs.neovim = {
    enable = true
  };
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
    nixswitch = "darwin-rebuild switch --flake ~/.config/nixpkgs/.#";
    nixup = "pushd ~/.config/nixpkgs; nix flake update; nixswitch; popd";
  };
  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;
  programs.ssh.knownHosts = [
    {
      hostNames = [ "github"  ];
      publicKeyFile = ~/.ssh/id_craigness24.pub;
    }
  ];

  home.file.".config/kitty".source = ./dotfiles/kitty;
  home.file.".ssh/config".source = ./dotfiles/sshconfig;
  home.file.".config/nvim/init.lua".source = ./dotfiles/nvim_init
}
