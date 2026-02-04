{
  description = "Sins Nix Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixos-wsl.url = "github:nix-community/nixos-wsl/release-25.05";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixos-wsl, ... }:
    let
      system = "x86_64-linux";
      username = "sins";
    in {
      nixosConfigurations = {
        wsl = nixpkgs.lib.nixosSystem {
          inherit system;
	  specialArgs = {
	    inherit username;
	  };
          modules = [
            nixos-wsl.nixosModules.default
            ./hosts/wsl
            ./modules/common
            ./modules/cli
          ];
        };

        sway = nixpkgs.lib.nixosSystem {
          inherit system;
	  specialArgs = {
	    inherit username;
	  };
          modules = [
            ./hosts/sway
            ./modules/common
            ./modules/cli
          ];
        };
      };
    };
}

