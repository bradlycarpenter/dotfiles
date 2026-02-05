{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    lua
    gcc
    gnumake
    nodejs
    pnpm
    go
    python3
    uv
    dotnet-sdk
    nixfmt
  ];

  virtualisation.docker = {
    enable = true;
  };
}
