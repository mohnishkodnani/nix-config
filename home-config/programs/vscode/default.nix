{ config, lib, pkgs, ...}:

{
  programs.vscode = {
    enable = true;
    package = with pkgs; vscodium;

    userSettings = {
      "workbench.colorTheme" = "Github Dark";
    };

    extensions = with pkgs.vscode-extensions; [
    	scalameta.metals
	bbenoist.Nix
	golang.Go
	matklad.rust-analyzer
	ms-python.python
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
	{
		name = "vscode-java-pack";
		publisher = "vscjava";
		version = "0.12.1";
		sha256 = "1xx84qg1jvhdxlrr3iki5zaggzm25a41vpdkxjdbkzfq41l1w6p1";
	}
    ];
  };
}
