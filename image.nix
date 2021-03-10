{ ... }: {
  imports = [
    <nixpkgs/nixos/modules/installer/cd-dvd/sd-image-aarch64.nix>
    ./configuration.nix
  ];

  sdImage = {
    imageName = "magicbox-sd";
    firmwareSize = 256;
  };
}
