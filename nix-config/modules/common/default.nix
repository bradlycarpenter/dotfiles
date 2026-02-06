{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    stow
    vim
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
