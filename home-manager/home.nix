{ pkgs, config, lib, ... }: {
  imports = [
    ./firefox.nix
    ./foot.nix
    ./git.nix 
    ./starship.nix
    ./tmux.nix
    ./zsh.nix
    ./lsd.nix
  ];

  home = {
    username = "bunbun";
    homeDirectory = "/home/bunbun";
    packages = with pkgs; [
      wl-clipboard
      dunst
      discord
      brightnessctl
    ];
  };

  xdg.desktopEntries."discord" = {
    name = "Discord"; 
    exec = "/usr/bin/discord --enable-featurs=UseOzonePlatform --ozone-platform=wayland";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.05";
}
