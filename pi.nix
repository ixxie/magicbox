{ config, pkgs, lib, ... }:
{

  boot = {
    kernelPackages = pkgs.linuxPackages_rpi3;
    initrd.includeDefaultModules = false;
    loader = {
      raspberryPi = {
        enable = true;
        version = 4;
        uboot.enable = false;
        firmwareConfig = ''
          gpu_mem=192
          dtoverlay=vc4-fkms-v3d
        '';
      };
      grub.enable = false;
      generic-extlinux-compatible.enable = false;
    };
  };
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-label/FIRMWARE";
      fsType = "vfat";
    };
  };
  
  hardware = {
    firmware = [ pkgs.raspberrypiWirelessFirmware ];
    bluetooth.enable = true;
    enableRedistributableFirmware = true;
    pulseaudio.enable = true;  
  };

  sound.enable = true;
  services.dbus.enable = true;
  
  swapDevices = [ { device = "/swapfile"; size = 1024; } ];
}
