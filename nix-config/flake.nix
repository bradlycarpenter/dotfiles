{
  description = "Sins Nix Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixos-wsl.url = "github:nix-community/nixos-wsl/release-25.11";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { home-manager, nixpkgs, nixos-wsl, ... }:
    let
      system = "x86_64-linux";
      username = "sins";
    in {
      nixosConfigurations = {
        wsl = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit username; };
          modules = [
            nixos-wsl.nixosModules.default
            ./hosts/wsl
            ./modules/common
            home-manager.nixosModules.home-manager
            ({ ... }: {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.${username} = {
                imports = [
                  ./home/cliTools.nix
                  ./home/neovim.nix
                  ./home/devTools.nix
                ];
              };
            })
          ];
        };

        thinkpadLaptop = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit username; };
          modules = [
            ./hosts/thinkpadLaptop
            ./modules/common
            home-manager.nixosModules.home-manager
            ({ ... }: {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.${username} = {
                imports = [
                  ./home/cliTools.nix
                  ./home/neovim.nix
                  ./home/devTools.nix
                  ./home/sway.nix
                  ./home/desktopApps.nix
                ];
              };
            })
          ];
        };

      };
    };
}

