{
  description = "A simple flake with a development shell using Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        # nix build
        defaultPackage = self.packages.${system};

        devShells = pkgs.mkShell {
          COLOR = "blue";

          buildInputs = with pkgs; [
            cowsay
            lolcat
            zsh
          ];
          
          shellHook = ''
            echo "Welcome! This is a simple flake with a development shell using Nix" | ${pkgs.lolcat}/bin/lolcat 
            export SHELL=${pkgs.zsh}/bin/zsh
            exec ${pkgs.zsh}/bin/zsh
            '';
        };

        # nix develop or nix shell
        devShell = self.devShells.${system};
      }
    );
}
