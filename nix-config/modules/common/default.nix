{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ git vim neovim ];
  programs.git.enable = true;
}
