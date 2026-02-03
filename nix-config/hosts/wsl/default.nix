{ pkgs, ... }:

{
  wsl.enable = true;
  wsl.defaultUser = "sins";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  system.stateVersion = "25.05";
}
