{ pkgs, ... }: {
  imports = [ ./git.nix ];

  home.username = "bunbun";
  home.homeDirectory = "/home/bunbun";

  programs.home-manager.enable = true;
  home.stateVersion = "23.05";
}
