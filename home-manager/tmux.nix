{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    extraConfig = 
    ''
      set -g status-left ""

      set-option -g status-style bg=default

      bind-key -n C-Enter new-window

      bind-key -n C-c kill-window
      bind-key -n C-c kill-pane

      bind-key -n C-r source-file ~/.config/tmux/tmux.conf

      bind-key -n C-q kill-session

      bind-key -n C-M-q kill-server

      bind-key -n C-h split-window -h
      bind-key -n C-v split-window -v

      bind-key -n C-Left select-pane -L
      bind-key -n C-Right select-pane -R
      bind-key -n C-Up select-pane -U
      bind-key -n C-Down select-pane -D

      bind-key -n C-M-Up swap-pane -U
      bind-key -n C-M-Down swap-pane -D

      bind-key -n C-1 if-shell "tmux list-windows | grep -q '^1'" "select-window -t 1" "new-window -t 1"
      bind-key -n C-2 if-shell "tmux list-windows | grep -q '^2'" "select-window -t 2" "new-window -t 2"
      bind-key -n C-3 if-shell "tmux list-windows | grep -q '^3'" "select-window -t 3" "new-window -t 3"
      bind-key -n C-4 if-shell "tmux list-windows | grep -q '^4'" "select-window -t 4" "new-window -t 4"
      bind-key -n C-5 if-shell "tmux list-windows | grep -q '^5'" "select-window -t 5" "new-window -t 5"
      bind-key -n C-6 if-shell "tmux list-windows | grep -q '^6'" "select-window -t 6" "new-window -t 6"
      bind-key -n C-7 if-shell "tmux list-windows | grep -q '^7'" "select-window -t 7" "new-window -t 7"
      bind-key -n C-8 if-shell "tmux list-windows | grep -q '^8'" "select-window -t 8" "new-window -t 8"
      bind-key -n C-9 if-shell "tmux list-windows | grep -q '^9'" "select-window -t 9" "new-window -t 9"
      bind-key -n C-0 if-shell "tmux list-windows | grep -q '^10'" "select-window -t 10" "new-window -t 10"
    
      bind-key -n C-M-1 if-shell "tmux list-windows | grep -q '^1'" "break-pane \; join-pane -t 1" "break-pane -t 1"
      bind-key -n C-M-2 if-shell "tmux list-windows | grep -q '^2'" "break-pane \; join-pane -t 2" "break-pane -t 2"
      bind-key -n C-M-3 if-shell "tmux list-windows | grep -q '^3'" "break-pane \; join-pane -t 3" "break-pane -t 3"
      bind-key -n C-M-4 if-shell "tmux list-windows | grep -q '^4'" "break-pane \; join-pane -t 4" "break-pane -t 4"
      bind-key -n C-M-5 if-shell "tmux list-windows | grep -q '^5'" "break-pane \; join-pane -t 5" "break-pane -t 5"
      bind-key -n C-M-6 if-shell "tmux list-windows | grep -q '^6'" "break-pane \; join-pane -t 6" "break-pane -t 6"
      bind-key -n C-M-7 if-shell "tmux list-windows | grep -q '^7'" "break-pane \; join-pane -t 7" "break-pane -t 7"
      bind-key -n C-M-8 if-shell "tmux list-windows | grep -q '^8'" "break-pane \; join-pane -t 8" "break-pane -t 8"
      bind-key -n C-M-9 if-shell "tmux list-windows | grep -q '^9'" "break-pane \; join-pane -t 9" "break-pane -t 9"
      bind-key -n C-M-0 if-shell "tmux list-windows | grep -q '^10'" "break-pane \; join-pane -t 10" "break-pane -t 10"
    
      set -g prefix None

      set -g mouse on
    '';
  };
}
