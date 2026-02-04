{ pkgs, username, ... }: {
  environment.systemPackages = with pkgs; [ git vim neovim ];
  programs.git.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
