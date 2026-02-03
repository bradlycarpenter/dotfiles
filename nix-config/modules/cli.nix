{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    neovim
    yazi
    lazygit
    stow
  ];
}
