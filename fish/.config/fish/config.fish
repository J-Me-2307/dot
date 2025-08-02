set -Ux EDITOR nvim
set -Ux VISUAL nvim
set -U fish_user_paths $HOME/go/bin $fish_user_paths

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

# Auto tmux
if status is-interactive
    and not set -q TMUX
    exec tmux
end

# Replace ls with eza
alias ls='eza -al --color=always --group-directories-first --icons' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons' # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons' # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
alias l.="eza -a | grep -e '^\.'" # show only dotfiles

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias update='sudo pacman -Syu'

# zoxide
zoxide init fish | source

set -Ux fish_user_paths $HOME/.rbenv/bin $fish_user_paths

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin /home/jamie/.ghcup/bin $PATH # ghcup-env
