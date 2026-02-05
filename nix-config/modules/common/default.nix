{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
