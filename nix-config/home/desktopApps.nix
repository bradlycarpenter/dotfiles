{ pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
    bitwarden-desktop
  ];

  home.stateVersion = "25.11";
}
