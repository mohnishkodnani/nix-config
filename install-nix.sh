#!/usr/bin/env bash
set -exuo pipefail

NIXDIR="$HOME/.config/nixpkgs"
mkdir -p "$NIXDIR"
[[ -e "$NIXDIR"/home.nix ]] || ln -sv "$(pwd)"/home-config "$NIXDIR"

echo "Checking if nix is installed"

if ! command -v nix-env &> /dev/null
then
	echo "Nix is not installed, trying to intall it."
	curl -L https://nixos.org/nix/install | sh
	. /home/mohnishkodnani/.nix-profile/etc/profile.d/nix.sh
else
	echo "Nix is installed, moving on..."
fi
echo "Installing Home Manager...."
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
nix-shell '<home-manager>' -A install
home-manager switch
