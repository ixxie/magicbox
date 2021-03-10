{ config, pkgs, lib, ... }:
{
  services.cage = {
    enable = true;
    user = "kodi";
    program = "${pkgs.kodi-wayland}/bin/kodi-standalone";
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
