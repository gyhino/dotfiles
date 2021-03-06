# vim:ft=zsh

if is-at-least 4.3.10; then
    autoload -Uz vcs_info
    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' formats ' on %b'
    zstyle ':vcs_info:*' actionformats ' on %b:%a'
    precmd() {
        psvar=()
        LANG=en_US.UTF-8 vcs_info
    }
fi

vim_=""
if [ -n "${VIMRUNTIME}" ]; then
    vim_="${fg[magenta]}(vim) ${reset_color}"
fi

PROMPT='${vim_}${fg[green]}%M${reset_color} %/${fg[yellow]}${vcs_info_msg_0_}${reset_color}'$'\n''%# '
PROMPT2='> '
SPROMPT='%R -> %r ? '
RPROMPT='%{$fg[yellow]%}${ZSH_KUBECTL_PROMPT}%{$reset_color%}'

# プロンプトエスケープシーケンス有効化
setopt prompt_subst

# コマンド実行後は右プロンプトを消す
setopt transient_rprompt
