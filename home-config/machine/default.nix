{ config, lib, pkgs, ...}:

{
  nixpkgs.config.allowUnfree = true;
#  hardware.opengl = {
#  	enable = true;
#	extraPackages = with pkgs; [
#		libGL
#	];
#	setLdLibraryPath = true;
#  };
}
