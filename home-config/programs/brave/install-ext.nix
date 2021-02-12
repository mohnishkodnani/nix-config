{ baseDir }:

let
	extDir = "${baseDir}/extensions";

	x = import ./extensions.nix;
	ext = builtins.toJSON {
	  external_update_url = "https://clients2.google.com/service/update2/crx";
        };
in 
{
  xdg.configFile."${extDir}${x.dark-reader}.json".text = ext;
  xdg.configFile."${extDir}${x.github-dark-reader}.json".text = ext;
  xdg.configFile."${extDir}${x.raindrop}.json".text = ext;
  xdg.configFile."${extDir}${x.gnome-extensions}.json".text = ext;
}
