{ pkgs, ... }: 
{
  programs.tmux= {
    enable = true;
    shortcut = "a";
    keyMode = "vi";
    clock24 = true;
    baseIndex = 1;
    escapeTime = 10;
    historyLimit = 50000;

    newSession = true;
    terminal = "screen-256color";

    plugins = with pkgs; [
      tmuxPlugins.catppuccin

    ];

    extraConfig= ''
    # unbind b
    # unbind =
    # unbind -
    #
    set-option -g mouse off

    bind-key p previous-window
    bind-key n next-window

    bind - split-window -v -c "#{pane_current_path}"
    bind = split-window -h -c "#{pane_current_path}"
    bind c new-window -c "#{pane_current_path}"

    bind -r k select-pane -U 
    bind -r j select-pane -D 
    bind -r h select-pane -L 
    bind -r l select-pane -R 

      
    set -g @catppuccin_window_status_enable "no"
    set -g @catppuccin_status_modules_right "user session date_time"
    set -g @catppuccin_date_time_text "%H:%M:%S"

    set -g default-terminal "xterm-256color"
    set -ga terminal-overrides ",*256col*:Tc"
    set -ga terminal-overrides '*:Ss=\E[%p2%d q:Se=\E[ q'
    set-environment -g COLORTERM "truecolor"

    '';

  };
}
