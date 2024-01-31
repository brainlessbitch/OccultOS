{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    overlays = [];

    config = {
      allowUnfree = true;
    };
  };

  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs
  (_: lib.isType "flake")) inputs);

  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  system.nixos.distroName = lib.mkForce "OccultOS";
  system.nixos.distroId = lib.mkForce "occultos";

  networking.hostName = "warren";

  #boot.loader.systemd-boot.enable = true;
  boot.loader.grub.devices = [ "nodev" ];

  users.users = {
    bunbun = {
      isNormalUser = true;
      extraGroups = ["wheel"];
    };
  };
}
