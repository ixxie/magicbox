{ config, pkgs, lib, ... }:
{
  networking.hostName = "magicbox";

  environment.systemPackages = with pkgs; [ neovim screen ];
  
  nixpkgs.config.allowUnfree = true;
  
  services.openssh.enable = true;
  
  security.sudo.wheelNeedsPassword = false;
}
