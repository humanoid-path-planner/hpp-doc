{
  description = "Documentation for project Humanoid Path Planner";

  inputs.gepetto.url = "github:gepetto/nix";

  outputs =
    inputs:
    inputs.gepetto.lib.mkFlakoboros inputs (
      { lib, ... }:
      {
        overrideAttrs.hpp-doc = {
          src = lib.fileset.toSource {
            root = ./.;
            fileset = lib.fileset.unions [
              ./CMakeLists.txt
              ./doc
              ./package.xml
              ./scripts
            ];
          };
        };
      }
    );
}
