{
  description = "Sins Nix Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixos-wsl.url = "github:nix-community/nixos-wsl/release-25.11";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      home-manager,
      unstable,
      nixpkgs,
      nixos-wsl,
      ...
    }:
    let
      system = "x86_64-linux";
      username = "sins";
      unstablePkgs = import unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {
        wsl = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit username unstablePkgs; };
          modules = [
            nixos-wsl.nixosModules.default
            ./hosts/wsl
            ./modules/common
            ./modules/devTools.nix
            home-manager.nixosModules.home-manager
            (
              { ... }:
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;

                home-manager.users.${username} = {
                  imports = [
                    ./home/cliTools.nix
                    ./home/neovim.nix
                  ];
                };
              }
            )
          ];
        };

        thinkpadLaptop = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit username unstablePkgs; };
          modules = [
            ./hosts/thinkpadLaptop
            ./modules/common
            ./modules/devTools.nix
            home-manager.nixosModules.home-manager
            (
              { ... }:
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;

                home-manager.users.${username} = {
                  imports = [
                    ./home/cliTools.nix
                    ./home/neovim.nix
                    ./home/sway.nix
                    ./home/desktopApps.nix
                  ];
                };
              }
            )
          ];
        };

      };
    };
}
