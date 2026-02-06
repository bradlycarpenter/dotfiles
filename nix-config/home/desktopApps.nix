{ pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
    bitwarden-desktop
    kdePackages.okular
    obsidian
  ];

  home.stateVersion = "25.11";
}
