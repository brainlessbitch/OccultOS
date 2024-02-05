{ pkgs, config, ... }: {
  programs.zsh = {
    enable = true;
    history = {
      save = 10000;
      size = 10000;
      path = "${config.xdg.configHome}/zsh/history";
    };
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch = {
      enable = true;
      searchUpKey = "^[[A";
      searchDownKey = "^[[B";
    };
    shellAliases = {
      ls = "lsd -a --group-directories-first";
      ll = "lsd -la --group-directories-first";
    };
    initExtra = 
      ''
        zstyle ":completion:*" verbose true
        zstyle ":completion:*:*:*:*:*" menu select
        zstyle ":completion:*:default" list-color ${(s.:.)LS_COLORS}
        zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}"
      '';

    # .zprofile
    profileExtra = 
      ''
        if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
          exec Hyprland
        fi
      '';
  };
}
