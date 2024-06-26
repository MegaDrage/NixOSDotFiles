{
  description = "MegaDrage's config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          modules = [ 
            ./nixos/configuration.nix
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
	      home-manager.backupFileExtension = "$HOME/backup.hm";
              home-manager.users.megadrage = {
                imports = [ ./home-manager/home.nix ];
              };
            }
          ];
        };
      };
    };
}
