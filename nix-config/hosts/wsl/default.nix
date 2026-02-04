{ config, pkgs, username, ... }:

{
  wsl.enable = true;
  wsl.defaultUser = username;
  system.stateVersion = "25.05";
   
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  home-manager.users.${username} = {
    imports = [
      ../../home/shared
    ];
  };
}
