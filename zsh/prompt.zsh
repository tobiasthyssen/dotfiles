# Load version control information
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats '(%b%u%c)'
zstyle ':vcs_info:*' actionformats '(%a|%m)'
zstyle ':vcs_info:*' unstagedstr '%{%F{red}%}●%{%f%}'
zstyle ':vcs_info:*' stagedstr '%{%F{green}%}●%{%f%}'
zstyle ':vcs_info:git:*' patch-format '%10>...>%p%<< (%n applied)'

parse_ssh_connection() {
  [[ -n $SSH_CONNECTION ]] && echo "%n@%m "
}

PROMPT='$(parse_ssh_connection)%F{cyan}%~%f ${vcs_info_msg_0_} %F{yellow}>%f'
