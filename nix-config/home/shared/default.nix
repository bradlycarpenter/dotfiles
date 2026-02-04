{ pkgs, ... }:

{
  imports = [
    ./neovim.nix
  ];

  home.stateVersion = "25.05";
}

