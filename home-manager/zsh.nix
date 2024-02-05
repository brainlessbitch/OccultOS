{ pkgs, config, ... }: {
  programs.zsh = {
    enable = true;
    history = {
      size = 10000;
      path = "${config.xdg.configHome}/zsh/history";
    };
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;
    shellAliases = {
      ls = "lsd -a --group-directories-first";
      ll = "lsd -la --group-directories-first";
    };
  };
}
