{ pkgs, nixGL, ...}:
{
    programs.zoom = {
      package = pkgs.writeShellScriptBin "zoom-us" ''
        #!/bin/sh
	${nixGL}/bin/nixGLIntel ${pkgs.zoom-us}/bin/zoom "$@"
      '';
    };
}
