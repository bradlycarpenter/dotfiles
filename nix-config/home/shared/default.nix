{ ... }:

{
  imports = [ ./neovim.nix ];

  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    escapeTime = 10;
  };

  home.stateVersion = "25.11";
}

