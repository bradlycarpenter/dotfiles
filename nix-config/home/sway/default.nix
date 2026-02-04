{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vim
    git
    gh
    kitty
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
    zoxide
    pkgs.nerd-fonts.jetbrains-mono
  ];

  programs.bash.enable = true;

  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
  };

  programs.btop = {
    enable = true;

    settings = { color_theme = "monokai"; };
  };

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
        name = "sins";
        email = "sinsmailza@gmail.com";
      };
    };
  };

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;

    config = {
      modifier = "Mod4";
      terminal = "kitty";
      input."*" = { xkb_options = "altwin:swap_alt_win"; };
      input."type:touchpad" = {
        natural_scroll = "enabled";
        tap = "enabled";
        middle_emulation = "enabled";
      };
    };
  };

  home.stateVersion = "25.11";
}
