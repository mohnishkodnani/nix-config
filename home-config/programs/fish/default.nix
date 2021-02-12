{ config, pkgs, lib, ...}:

let
  starship = "${pkgs.starship}/bin/starship";
  fzfConfig = ''
    set -x FZF_DEFAULT_OPTS "--preview='bat {} --color=always'"
    set -x SKIM_DEFAULT_COMMAND "rg --files || find ."
  '';

  themeConfig = ''
#    set -g theme_display_date no
#    set -g theme_nerd_fonts no
#    set -g theme_powerline_fonts yes
#    set -g theme_display_git_master_branch master
#    set -g theme_newline_cursor yes
#    set -g theme_color_scheme solarized
#    set -g theme_newline_prompt '$ '
#    set -g theme_git_default_branches master main
#    set -g theme_color_scheme dracula
  '';
   
#  fishPlugins = pkgs.callPackage ./plugins.nix {};
  
  fishConfig = fzfConfig + themeConfig + ''
    set fish_greeting
    eval (direnv hook fish)
    ${starship} init fish | source
  '';
in {
  home.sessionVariables = {
    SHELL = "${pkgs.fish}/bin/fish";
  };
  programs.fish = {
    enable = true;
    plugins = [ 
#      fishPlugins.theme
#      spacefish
    ];
    promptInit = ''
#      any-nix-shell fish --info-right | source
    '';
    shellAliases = {
      cat = "bat";
      grep = "rg";
      docker = "podman";
      ls = "exa";
      ll = "exa -als modified";
      tree = "exa --tree";
      vi = "nvim";
      vim = "nvim";
      code = "codium";
    };
    shellInit = fishConfig;
  };
#  xdg.configFile."fish/functions/fish_prompt.fish".text = fishPlugins.prompt;
#  xdg.configFile."fish/conf.d/plugin-bobthefish.fish".text = lib.mkAfter ''
#    for f in $plugin_dir/*.fish
#      source $f
#    end
#    '';
}
