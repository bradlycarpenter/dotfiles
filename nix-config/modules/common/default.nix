{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ git vim ];
  programs.git.enable = true;
}
