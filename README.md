# neovimNixOSFlake
My nix flake for neovim

To run this flake add an alias to your home-manager config.

- To run local:
    - nvim = "nix run ~/git/<location> --";

- To run from Github:
    - nvim = "nix run github:<address> --";

To update the flake:

- nix flake update

Instructions provided by:
- https://primamateria.github.io/blog/neovim-nix/#generate-lua-config-from-nix
- https://primamateria.github.io/blog/neovim-nix-update/

Changes for the sake of changes
