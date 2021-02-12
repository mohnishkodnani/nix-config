{config, lib, pkgs, ...}:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    
    extraConfig = ''
      :set number
      :set ic
    '';

    plugins = with pkgs.vimPlugins; [
      
    ];
  };
}
