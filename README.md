# nix-shell demo

This is a demo of a contained declarative development environment using nix shell.

Based on [video](https://www.youtube.com/watch?v=yQwW8dkuHqw) / [code](https://github.com/vimjoyer/devshells-video)

## Usage

1. Install [Nix](https://nix.dev/install-nix):

  ```sh
  curl -L https://nixos.org/nix/install | sh
  ```

2. Clone the repo and run `nix-shell` to enter the custom non-flake development shell as defined in `shell.nix`, or `nix develop` to enter the flake development shell as defined in `flake.nix`.

3. Run `nix shell github:legomb/nix-shell-demo` to enter the custom flake development shell without cloning the repo.
