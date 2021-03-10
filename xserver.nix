{ config, pkgs, lib, ... }:
{
   services.xserver = {
    enable = true;
    desktopManager.kodi.enable = true;
    displayManager.autoLogin = {
      enable = true;
      user = "kodi";
    };
  };

  users.users.kodi = {
      isNormalUser = true;
  };

  networking = {
    firewall = {
      allowedTCPPorts = [ 8080 ];
      allowedUDPPorts = [ 8080 ];
    };
  };
}
