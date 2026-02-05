{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lua
    gcc
    gnumake
    nodejs
    pnpm
    go
    python3
    uv
    dotnet-sdk
  ];
}
