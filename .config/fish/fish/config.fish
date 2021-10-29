set -U fish_vi_key_bindings
set -U fish_greeting
bind -M insert \cc kill-whole-line repaint
bind -M insert \co 'rangercd; commandline -f repaint'


if status is-interactive
    # Commands to run in interactive sessions can go here
end
