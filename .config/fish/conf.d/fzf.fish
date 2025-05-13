if type -q fzf
    fzf --fish | source

    set -gx FZF_DEFAULT_OPTS "
      --color=bg:#282c34,bg+:#3b4252,fg:#cad3f5,fg+:#f5e0dc
      --color=hl:#a6adc8,hl+:#f5e0dc,info:#98c379,prompt:#fabd2f,pointer:#f38ba8
      --color=marker:#fabd2f,spinner:#a6adc8,header:#a6adc8
    "

    set -gx FZF_DEFAULT_COMMAND 'fd --hidden --strip-cwd-prefix --exclude .git'
    set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
    set -gx FZF_ALT_C_COMMAND 'fd --type=d --hidden --strip-cwd-prefix --exclude .git'

    function fzn
        nvim (fzf --preview "bat --style=plain --color=always {}" --preview-window=right:60%)
    end
end
