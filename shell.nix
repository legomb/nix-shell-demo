{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell
{
	nativeBuildInputs = with pkgs; [
		nodejs
	];

	COLOR = "blue";

	# Contents of password.nix should be a quoted string:
	PASSWORD = import ./password.nix;
	
	shellHook = ''
		echo "welcome to my shell!" | ${pkgs.lolcat}/bin/lolcat 
	'';
}
