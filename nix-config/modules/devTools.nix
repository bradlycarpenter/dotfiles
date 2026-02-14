{ pkgs, ... }:
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
  ];

  virtualisation.docker = {
    enable = true;
  };
}
