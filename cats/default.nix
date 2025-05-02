{ nixpkgs }:
{
  categoryDefinitions = import ./categories.nix;
  packageDefinitions = import ./packages.nix { inherit nixpkgs; };
}
