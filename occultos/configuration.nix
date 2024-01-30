{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  impots = [
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

  networking.hostName = "occultos";

  boot.loader.systemd-boot.enable = true;

  users.users = {
    witch = {
      initalPassowrd = "witch";
      isNormalUser = true;
      extraGroups = ["wheel"];
    };
  };
}
