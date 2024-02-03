{ pkgs, ... }: {
  imports = [ ./git.nix ./foot.nix ];

  home.username = "bunbun";
  home.homeDirectory = "/home/bunbun";

  home.packages = with pkgs; [ wl-clipboard ];

  programs.home-manager.enable = true;
  home.stateVersion = "23.05";
}
