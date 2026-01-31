{ config, pkgs, ... }:

{
   home.packages = with pkgs; [
     vim
     git
     kitty
     stow
     firefox
     bitwarden-desktop
     pkgs.nerd-fonts.jetbrains-mono
   ];

  programs.bash.enable = true;

  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
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
