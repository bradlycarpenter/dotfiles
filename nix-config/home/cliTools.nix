{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gh
    yazi
    lazygit
    unzip
    fd
    ripgrep
  ];

  programs.bash.enable = true;

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.btop = {
    enable = true;
    settings = { color_theme = "monokai"; };
  };

  programs.git = {
    enable = true;
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    escapeTime = 10;
  };

  home.stateVersion = "25.11";
}
