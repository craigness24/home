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
  programs.bat.enable = true;
  programs.bat.config.theme = "TwoDark";
  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;
  programs.exa.enable = true;
  programs.git.enable = true;
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
#  programs.kitty = {
#    enable = true;
#    settings.font_family = "JetbrainsMono Nerd Font Mono";
#    settings.font_size = 16;
#    settings.hide_window_decorations = "titlebar-only";
#  };
  home.file.".config/kitty".source = ./dotfiles/kitty;
  home.file.".ssh/config".source = ./dotfiles/sshconfig;
}
