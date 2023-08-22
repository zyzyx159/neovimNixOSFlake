{ pkgs }:
let
  customRC = import ../config {inherit pkgs; };
  plugins = import ../plugins.nix {inherit pkgs; };
in pkgs.wrapNeovim pkgs.neovim {
    configure = {
      inherit customRC;
      # change all to opt for lazy load
      packages.all.start = plugins;
    };
  }
