{ pkgs, ...}:

let 
	baseDir = "BraveBrowser";
in 
{
#	import ./install-ext.nix { inherit baseDir; }
  programs.brave = {
	enable = true;
	extensions = [
	"eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Theme
	"odkdlljoangmamjilkamahebpkgpeacp" # github-dark-reader
	"ldgfbffkinooeloadekpmfoklnobpien" # Raindrop
	"gphhapmejobijbbhgpjhcjognlahblep" # Gnome Extensions
	];
  };
}
