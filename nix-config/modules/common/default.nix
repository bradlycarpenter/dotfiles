{ pkgs, username, ... }: {
  environment.systemPackages = with pkgs; [ git vim ];
  programs.git.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
