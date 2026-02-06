{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
    pkgs.nerd-fonts.jetbrains-mono
    darkman
  ];

  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
    
    extraConfig = ''
      include ./current-theme.conf
    '';
  };

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;

    config = {
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

  home.stateVersion = "25.11";
}
