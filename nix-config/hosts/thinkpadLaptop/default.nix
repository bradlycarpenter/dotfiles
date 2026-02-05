{ pkgs, username, ... }: {

  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.graphics.enable = true;

  services.xserver.videoDrivers = [ "modesetting" ];

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  time.timeZone = "Africa/Johannesburg";

  i18n.defaultLocale = "en_ZA.UTF-8";

  services.dbus.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  security.polkit.enable = true;

  nixpkgs.config.allowUnfree = true;

  services.openssh.enable = true;

  system.stateVersion = "25.11";
}
