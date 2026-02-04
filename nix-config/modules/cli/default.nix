{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    yazi
    lazygit
    stow
  ];
}
