{ lib, pkgs, inputs, ... }: {
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];

  # Nix
  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;

      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
  };

  # ディストロ名の変更
  system.nixos.distroName = lib.mkForce "OccultOS";
  system.nixos.distroId = lib.mkForce "occultos";

  environment.systemPackages = with pkgs; [vim git];

  # ユーザー
  users.users.bunbun = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel"];
  };

  # ネットワーキング
  networking = {
    hostName = "warren";
    networkmanager.enable = true;
  };

  # ブートローダ
  boot.loader.systemd-boot.enable = true;

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
}
