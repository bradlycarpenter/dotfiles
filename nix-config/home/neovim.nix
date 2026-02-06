{ pkgs, ... }:

let
  auto-dark-mode-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "auto-dark-mode-nvim";
    version = "unstable";
    src = pkgs.fetchFromGitHub {
      owner = "f-person";
      repo = "auto-dark-mode.nvim";
      rev = "e300259ec777a40b4b9e3c8e6ade203e78d15881";
      sha256 = "sha256-PhhOlq4byctWJ5rLe3cifImH56vR2+k3BZGDZdQvjng=";
    };
  };
in
{
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      monokai-pro-nvim
      auto-dark-mode-nvim
    ];
  };
}
