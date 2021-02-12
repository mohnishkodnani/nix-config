{ config, pkgs, ... }:
let 
  # Default packages needed  
  defaultPkgs = with pkgs; [
    any-nix-shell           # fish shell support for nix-shell
    bat                     # better cat
    exa                     # better ls
    fzf                     # fuzzy find files
    jq                      # json query tool
#    kitty                  # yet another gpu powered terminal.
    podman                  # better docker
    ripgrep                 # better grep
    rustup                  # rust installer
#    vscode
    brave                   # privacy browser
    bottom                  # alternative to htop
    neofetch                # command line system information
    skype
    signal-desktop          # privacy oriented messaging application.
    spotify                 # music source
    tmux                    # terminal multiplexer
    tree                    # display file in tree view
    vlc                     # media player
    xclip                   # clipboard support ( also for neovim )
    zoom-us
    nixGL                   # wrapper for openGL applications like kitty, alacritty.
    nix-prefetch-git
    # Programming
#    sbt
#    scala
#    scalafmt
#    coursier
    ammonite
    bloop
    jdk11
    go
  ];
  gitPkgs = with pkgs.gitAndTools; [
    diff-so-fancy           # git diff with colors
    git-crypt               # git file encryption
  ];
  fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "SourceCodePro"];
    })
    noto-fonts-emoji
    starship
  ];
  nixGL = (import (pkgs.fetchFromGitHub {
	owner = "guibou";
	repo = "nixGL";
	rev = "7d6bc1b21316bab6cf4a6520c2639a11c25a220e";
	sha256 = "02y38zmdplk7a9ihsxvnrzhhv7324mmf5g8hmxqizaid5k5ydpr3";
	
  }) {}).nixGLIntel;
  alacrittyTerm = import ./programs/alacritty/default.nix { fontSize = 14; inherit pkgs; nixGL = nixGL; };
#  kittyTerm = import ./programs/kitty/default.nix { fontSize = 14; inherit pkgs; nixGL = nixGL; };
  zoom = import ./programs/zoom-chat/default.nix { inherit pkgs; nixGL = nixGL;};
in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "mohnishkodnani";
  home.homeDirectory = "/home/mohnishkodnani";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";

  # Necessary programs
  imports = [
    ./machine/default.nix
    ./programs/neovim/default.nix
    ./programs/vscode/default.nix
    ./programs/fish/default.nix
    ./programs/brave/default.nix
    ./programs/git/default.nix
    alacrittyTerm
#    kittyTerm
#    zoom

  ];
  # following xdg settings make sure the applications installed via home-manager show up in applications.
  xdg.enable = true;
  xdg.mime.enable = true;
#  targets.genericLinux.enable = true;
  pam.sessionVariables = config.home.sessionVariables  // {
    LANGUAGE = "en_US";
    LANG = "en_US.UTF-8";
  }; 
  home = {
    packages = defaultPkgs ++ gitPkgs ++ fonts;
    sessionVariables = {
      LANG = "en_US.UTF-8";
      LANGUAGE = "en_US";
      EDITOR = "nvim";
    };
  };
  programs = {
    direnv = { # direnv per directory that load the environment in the shell and with nix integration loads nix-shell with shell.nix
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
      enableNixDirenvIntegration = true;
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
    };
  };
  fonts.fontconfig.enable = true;
}
