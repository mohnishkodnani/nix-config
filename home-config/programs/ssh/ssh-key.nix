{ pkgs, ...}:
let 
   keygen = "ssh-keygen";
   add = "ssh-add";
   ssh-agent = "ssh-agent";
in
	pkgs.writeShellScriptBin "github-ssh-key" ''
	  # Create ssh key
#	  read -p "Enter passphrase for ssh key: " passphrase
	  ${keygen} -t ed25519 -C "mohnish.kodnani@gmail.com" -f ~/.ssh/github_id -N "$passphrase"
	  eval $(${ssh-agent} -s)
	  ${add} ~/.ssh/github_id
	''
