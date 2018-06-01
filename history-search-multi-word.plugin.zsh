# -*- Mode: sh; sh-indentation: 4; indent-tabs-mode: nil; sh-basic-offset: 4; -*-
# vim:ft=zsh:sw=4:sts=4:et

#
# No plugin manager is needed to use this file. All that is needed is adding:
#   source {where-unpacked}/history-search-multi-word.plugin.zsh
# to ~/.zshrc.
#

0="${(%):-%N}" # this gives immunity to functionargzero being unset
HSMW_REPO_DIR="${0%/*}"
if [[ -z "$ZPLG_CUR_PLUGIN" && "${fpath[(r)$HSMW_REPO_DIR]}" != $HSMW_REPO_DIR ]]; then
    fpath+=( "$HSMW_REPO_DIR" )
fi

autoload history-search-multi-word hsmw-context-main
zle -N history-search-multi-word
zle -N history-search-multi-word-backwards history-search-multi-word
zle -N history-search-multi-word-pbackwards history-search-multi-word
zle -N history-search-multi-word-pforwards history-search-multi-word
[[ "${+termcap[Co]}" = 1 && "${termcap[Co]}" = "256" ]] && {
    zstyle ":history-search-multi-word" highlight-color "bg=17"
    typeset -gA HSMW_HIGHLIGHT_STYLES
    HSMW_HIGHLIGHT_STYLES[variable]="fg=112"
}
bindkey "^R" history-search-multi-word
