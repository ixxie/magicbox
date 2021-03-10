{ config, pkgs, lib, ... }:
{
 
  systemd.services.iwd.serviceConfig.Restart = "always";
  hardware = {
    enableRedistributableFirmware = true;
    firmware = [ pkgs.wireless-regdb ];
  };
  networking = {
    wireless.enable = true;
    useDHCP = false;
    interfaces.wlan0.useDHCP = true;
    networkmanager.wifi.backend = "iwd";
    wireless.iwd.enable = true;
  };
}
