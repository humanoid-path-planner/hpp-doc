{
  description = "Documentation for project Humanoid Path Planner";

  inputs = {
    nixpkgs.url = "github:gepetto/nixpkgs";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      perSystem =
        { pkgs, self', ... }:
        {
          devShells.default = pkgs.mkShell { inputsFrom = [ self'.packages.default ]; };
          packages = {
            default = self'.packages.hpp-doc;
            hpp-doc = pkgs.python3Packages.hpp-doc.overrideAttrs (_: {
              # TODO: remove this on next release
              prePatch = ''
                substituteInPlace scripts/packageDep --replace-fail \
                  "/usr/bin/env python3" \
                  "${pkgs.python3Packages.python.interpreter}"
              '';
              src = pkgs.lib.fileset.toSource {
                root = ./.;
                fileset = pkgs.lib.fileset.unions [
                  ./CMakeLists.txt
                  ./doc
                  ./package.xml
                  ./scripts
                ];
              };
            });
          };
        };
    };
}
