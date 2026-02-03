{
  description = "Sins Nix Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixos-wsl.url = "github:nix-community/nixos-wsl/release-25.05";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixos-wsl, ... }:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      inherit system;
      modules = [
        nixos-wsl.nixosModules.default
	./hosts/wsl
      ];
    };
  };
}
