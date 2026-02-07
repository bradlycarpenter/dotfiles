{ pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
    bitwarden-desktop
    kdePackages.okular
    obsidian
    pavucontrol
  ];

  home.stateVersion = "25.11";
}
