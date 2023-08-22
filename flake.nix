{
  description = "My own Neovim flake";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs";
    };
    neovim = {
      url = "github:neovim/neovim/stable?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, neovim }: 
    let
      overlayFlakeInputs = prev: final: {
        neovim = neovim.packages.x86_64-linux.neovim;
      }

      overlayMyNeovim = prev: final: {
        myNeovim = import ./packages/myNeovim.nix {
          pkgs = final;
        };
      };

      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ overlayFlakeInputs overlayMyNeovim ];
      };

    in {
      packages.x86_64-linux.default = pkgs.myNeovim;
      apps.x86_64-linux.default = {
        type = "app";
        program = "${pkgs.myNeovim}/bin/nvim";
      };
    };
  }

{
    packages.x86_64-linux.default = neovim.packages.x86_64-linux.neovim;
    apps.x86_64-linux.default = {
      type = "app";
      program = "${neovim.packages.x86_64-linux.neovim}/bin/nvim";
    };
  };
}