{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        version = "0.0.0.3";
        releasesUrl = "https://github.com/kamalsacranie/anki-panky/releases";
        ankiPanky = pkgs.stdenv.mkDerivation {
          name = "anki-panky";
          version = "0.0.0.3";
          src = pkgs.fetchzip {
            url = "${releasesUrl}/download/${version}/macOS-11-anki-panky-${version}.tar.gz";
            sha256 = "HJX0C7YKTYzbkCUnww3N2VBRcMNhGvvwBX0YBTnO5Us=";
          };
          phases = [ "installPhase" ];
          installPhase = ''
            mkdir -p $out/bin
            cp -R $src/anki-panky $out/bin/anki-panky
            chmod +x $out/bin/anki-panky
          '';
        };
        fonts = pkgs.nerdfonts.override { fonts = [ "Hasklig" ]; };
      in
      {
        devShells.default = with pkgs; mkShell {
          nativeBuildInputs = [
            fonts
          ];

          buildInputs = [
            ankiPanky
            pandoc
            tectonic
          ];
        };
      });
}
