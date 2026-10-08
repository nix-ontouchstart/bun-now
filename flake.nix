{
  description = "Bun Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
  };

  outputs = { self, nixpkgs }:
    let
      system = "aarch64-linux";
    in {
      packages.${system} = {
        default = nixpkgs.legacyPackages.${system}.writeShellScriptBin "bun-now" ''
          nix run github:nix-ontouchstart/bun -- -e 'console.log(Date.now())'
        '';
      };
    };
}

