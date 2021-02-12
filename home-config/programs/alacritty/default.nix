{ fontSize, pkgs, nixGL, ...}:

{
  home.sessionVariables  = {
    TERMINAL = "alacritty";
  };
  programs.alacritty = {
    enable = true;
    package = pkgs.writeShellScriptBin "alacritty" ''
	#!/bin/sh
	${nixGL}/bin/nixGLIntel ${pkgs.alacritty}/bin/alacritty "$@"
    '';
    settings = {
      font = {
        size = fontSize;
	normal = {
	  family = "FiraCode Nerd Font";
	  style = "Regular";
	};
	bold = {
	  family = "FiraCode Nerd Font";
	  style = "Bold";
	};
	italic = {
	  family = "FiraCode Nerd Font";
	  style = "Regular";
	};
	bold_italic = {
	  family = "FiraCode Nerd Font";
	  style = "Regular";
	};
      };
      shell = {
        program = "fish";
        args = [
          "-C"
          "neofetch"
        ]; 
      };
      dynamic_title = true;
      live_config_reload = true;
      selection.save_to_clipboard = true;
      window = {
        decorations = "full";
        padding = {
          x = 5;
          y = 5;
        };
      };
    };
  };
}
