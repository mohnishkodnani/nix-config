{ fontSize, pkgs, nixGL, ...}:

{
  programs.kitty = {
    enable = true;
#    package = pkgs.writeShellScriptBin "kitty" ''
#	#!/bin/sh
#	${nixGL}/bin/nixGLIntel ${pkgs.kitty}/bin/kitty "$@"
#    '';
#    settings = {
#      font.size = fontSize;
#      shell = {
#        program = "fish";
#        args = [
#          "-C"
#          "neofetch"
#        ]; 
#      };
#      selection.save_to_clipboard = true;
#      window = {
#        decorations = "full";
#        padding = {
#          x = 5;
#          y = 5;
#        };
#      };
#    };
  };
}
