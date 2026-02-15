{ pkgs, unstablePkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    lua
    lua-language-server
    gcc
    gnumake
    nodejs
    vtsls
    pnpm
    go
    python3
    uv
    dotnet-sdk
    nixfmt
    lazydocker
    unstablePkgs.resterm
  ];

  virtualisation.docker = {
    enable = true;
  };
}
