{ config, pkgs, ... }:

{
   home.packages = with pkgs; [
     vim
     tmux
     git
     gh
     kitty
     btop
     yazi
     lazygit
     stow
     firefox
     bitwarden-desktop
     lua
     gcc
     gnumake
     unzip
     fd
     ripgrep
     nodejs
     pnpm
     go
     python3
     uv
     dotnet-sdk
     neovim
     tree-sitter
     pkgs.nerd-fonts.jetbrains-mono
   ];

  programs.bash.enable = true;

  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name  = "sins";
        email = "sinsmailza@gmail.com";
      };
    };
  };

  home.stateVersion = "25.11";

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;

    config = rec {
      modifier = "Mod4";
      terminal = "kitty";
      input."*" = {
        xkb_options = "altwin:swap_alt_win";
      };
      input."type:touchpad" = {
        natural_scroll = "enabled";
        tap = "enabled";
        middle_emulation = "enabled";
      };
    };
  };
}
