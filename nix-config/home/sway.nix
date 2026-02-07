{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    kitty
    pkgs.nerd-fonts.jetbrains-mono
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

    extraConfig = ''
      bindsym XF86MonBrightnessDown exec light -U 10
      bindsym XF86MonBrightnessUp exec light -A 10

      bindsym XF86AudioRaiseVolume exec wpctl set-volume @DEFAULT_SINK@ 0.10+
      bindsym XF86AudioLowerVolume exec wpctl set-volume @DEFAULT_SINK@ 0.10-
      bindsym XF86AudioMute exec wpctl set-mute @DEFAULT_SINK@ toggle
    '';
  };

  home.stateVersion = "25.11";
}
