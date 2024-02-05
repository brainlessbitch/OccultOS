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

  environment.systemPackages = with pkgs; [
    home-manager
    vim
    git
  ];

  # ユーザー
  users.users.bunbun = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "audio" "wheel"];
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # ネットワーキング
  networking = {
    hostName = "warren";
    networkmanager.enable = true;
  };

  sound.enable = true;

  # ブートローダ
  boot.loader.systemd-boot.enable = true;

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  system = {
    nixos = {
      distroName = lib.mkForce "OccultOS";
      distroId = lib.mkForce "occultos";
    };
    stateVersion = "23.05";
  };
}
