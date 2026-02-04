{ username, ... }:

{
  wsl.enable = true;
  wsl.defaultUser = username;
  system.stateVersion = "25.05";
}
