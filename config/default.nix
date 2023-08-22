{ pkgs }:
let
  scripts2ConfigFiles = dir:
    let
      configDir = pkgs.stdenv.mkDerivation {
        name = "nvim-${dir}-configs";
        src = ./${dir};
        installPhase = ''
          mkdir -p $out/
          cp ./* $out/
        '';
      };
    in bulitins.map (file: "${configDir}/${file}")
    (builtins.attrNames (builtins.readDir configDir));

  sourceConfigFiles = files:
    builtins.concatStringSep "\n" (builtins.map (file:
      "source ${file}") files);

  vim = scrips2ConfigFiles "vim";
in sourveVonfigFiels vim
