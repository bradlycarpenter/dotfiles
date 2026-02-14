{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    stow
    vim
    wget
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
