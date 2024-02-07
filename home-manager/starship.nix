{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = builtins.concatStringsSep "" 
      [
        "$git_branch"
        "$git_status"
        "$directory"
        "$character"
      ];
      right_format = "$cmd_duration";
      directory = {
        format = "[ [$read_only]($read_only_style)$path ]($style)";
        style = "bg:black";
        read_only = "󰌾 ";
        read_only_style = "fg:red bg:black";
        truncation_symbol = "…/";
        truncation_length = 3;
      };
      character.format = " ";
      git_branch = {
        
      };
    };
  };
}
