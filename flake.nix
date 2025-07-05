{
  description = "Branco's nvim configuration with nixCats";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixCats.url = "github:BirdeeHub/nixCats-nvim";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixCats,
      flake-utils,
    }@inputs:
    let
      cats = import ./cats { inherit nixpkgs; };

      inherit (nixCats) utils;
      inherit (cats) categoryDefinitions packageDefinitions;

      luaPath = "${./.}";

      defaultPackageName = "nvim";
      extra_pkg_config = {
        allowUnfree = true;
        doCheck = false;
      };

      module_args = {
        moduleNamespace = [ defaultPackageName ];
        inherit
          nixpkgs
          defaultPackageName
          dependencyOverlays
          luaPath
          categoryDefinitions
          packageDefinitions
          ;
      };
      nixosModule = utils.mkNixosModules module_args;
      homeModule = utils.mkHomeModules module_args;
      overlays = utils.makeOverlaysWithMultiDefault luaPath {
        inherit nixpkgs dependencyOverlays extra_pkg_config;
      } categoryDefinitions packageDefinitions defaultPackageName;

      dependencyOverlays = [
        utils.standardPluginOverlay
        inputs
      ];
    in
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        nixCatsBuilder = utils.baseBuilder luaPath {
          inherit nixpkgs system dependencyOverlays;
        } categoryDefinitions packageDefinitions;
        defaultPackage = nixCatsBuilder defaultPackageName;
      in
      {
        formatter = pkgs.nixfmt-tree.override {
          settings = {
            formatter.nixfmt = {
              options = [ "--strict" ];
            };
          };
        };

        packages = utils.mkAllWithDefault defaultPackage;
      }
    )
    // {
      inherit
        utils
        overlays
        nixosModule
        homeModule
        ;
      nixosModules.default = nixosModule;
      homeModules.default = homeModule;
    };
}
