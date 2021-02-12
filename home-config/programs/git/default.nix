{ pkgs, ...}:

{
	programs.git = {
		enable = true;
		userEmail = "mohnish.kodnani@gmail.com";
		userName = "mohnishkodnani";
		ignores = [
                  "*~"
		  ".DS_Store"
		  "*.bloop"
		  "*.metals"
		  "*.metals.sbt"
		  "*.direnv"
		  ".envrc"
		  ".idea"
		  "*.vscode"
		  "*.python-version"
		];
		extraConfig = {
			init.defaultBranchName = "main";
			core = {
				pager = "diff-so-fancy | less --tabs=4 -RFX";
			};
			color = {
				ui = true;
				diff-highlight.oldNormal = "red bold";
				diff-highlight.oldHighligh ="red bold 52";
				diff-highlight.newNormal = "green bold";
				diff-highlight.newHighlight = "green bold 52";
				diff.meta = "11";
				diff.frag = "magenta bold";
				diff.commit = "yellow bold";
				diff.old = "red bold";
				diff.new = "green bold";
				diff.whitespace = "red reverse";
			};
			merge.tool = "codium";
			mergetool = {
				cmd = "codium --wait $MERGED";
			};
		};
	};
}
