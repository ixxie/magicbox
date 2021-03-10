{config, pkgs, ...}:
{
  imports = [ ./pi.nix ./core.nix ./users.nix ./speedtest.nix ];
}
