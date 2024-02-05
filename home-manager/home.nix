{ pkgs, ... }: {
  imports = [ ./git.nix ./foot.nix ./zsh.nix ./firefox.nix ];

  home = {
    username = "bunbun";
    homeDirectory = "/home/bunbun";
    packages = with pkgs; [
      wl-clipboard
      dunst
      discord
      lsd
    ];
  };

  xdg.desktopEntries."discord" = {
    name = "Discord"; 
    exec = "/usr/bin/discord --enable-featurs=UseOzonePlatform --ozone-platform=wayland";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.05";
}
