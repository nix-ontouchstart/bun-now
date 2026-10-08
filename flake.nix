{
  description = "Bun Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
  };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in {
      packages = forAllSystems (system: {
        default = nixpkgs.legacyPackages.${system}.writeShellScriptBin "bun-now" ''
          ${nixpkgs.legacyPackages.${system}.bun}/bin/bun -e 'console.log(Date.now())'
        '';
      });
    };
}

