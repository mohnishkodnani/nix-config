{ config, pkgs, lib, ...}:

{
  programs.ssh = {
    enable = true;
    matchBlocks."github.com" = {
        identitiesOnly = true;
        identityFile = "~/.ssh/id_github";
        extraOptions = { AddKeysToAgent = "yes"; };
    };
  };
}
