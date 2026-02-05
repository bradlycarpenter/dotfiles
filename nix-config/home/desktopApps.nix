{ pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
    bitwarden-desktop
    kdePackages.okular
  ];

  home.stateVersion = "25.11";
}
