{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils, }:
    let
      supportedSystems = [
        "x86_64-darwin"
        "x86_64-linux"
        "aarch64-darwin"
      ];
    in
    utils.lib.eachSystem supportedSystems (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        version = "0.0.0.7";
        releasesUrl = "https://github.com/kamalsacranie/anki-panky/releases";
        src =
          if system == "x86_64-darwin" || system == "aarch64-darwin"
          then
            pkgs.fetchzip {
              url = "${releasesUrl}/download/${version}/macOS-14-anki-panky-${version}.tar.gz";
              sha256 = "7kkfdx1vndheb63+m2HOLXo0wOYX4iReh9c7Ps/KYQk=";
            }
          else
            pkgs.fetchzip {
              url = "${releasesUrl}/download/${version}/ubuntu-latest-anki-panky-${version}.tar.gz";
              sha256 = "XF/7+4AvJ2VBJP8lO/199HrJuvKHMOWqfGNB99oEs84=";
            };
        ankiPanky = pkgs.stdenv.mkDerivation {
          name = "anki-panky";
          inherit src version;
          installPhase = ''
            mkdir -p $out/bin
            cp -R $src/anki-panky $out/bin/anki-panky
            chmod +x $out/bin/anki-panky
          '';
        };
      in
      with pkgs;
      {
        devShells.default = with pkgs; mkShell {
          buildInputs = [
            ankiPanky
            nerd-fonts.hasklug
            tectonic
          ];

          # Add necessary library dependencies
          LD_LIBRARY_PATH = "${lib.makeLibraryPath [
            gmp
            zlib
          ]}";
        };
      }
    );
}
