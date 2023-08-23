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
      (if pkgs.lib.strings.hasSuffix "lua" file then "luafile" else "source")
      + " ${file}") files);

  vim = scrips2ConfigFiles "vim";
  lua = scrips2ConfigFiles "lua";

in builtins.concatStrinsSep "\n"
(builtins.map (configs: sourceConfigFiles configs) [ vim lua])
