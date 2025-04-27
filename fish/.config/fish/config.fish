source /usr/share/cachyos-fish-config/cachyos-config.fish

function fish_greeting
    nerdfetch
end

# Yazi
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Starship
function starship_transient_prompt_func
    starship module character
end

starship init fish | source
enable_transience

if status is-interactive
    and not set -q TMUX
    exec tmux
end
