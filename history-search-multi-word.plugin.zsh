#
# No plugin manager is needed to use this file. All that is needed is adding:
#   source {where-unpacked}/history-search-multi-word.plugin.zsh
# to ~/.zshrc.
#

REPO_DIR="${0%/*}"
if [[ -z "$ZPLG_CUR_PLUGIN" && "${fpath[(r)$REPO_DIR]}" != $REPO_DIR ]]; then
    fpath+=( "$REPO_DIR" )
fi

autoload history-search-multi-word
zle -N history-search-multi-word
zle -N history-search-multi-word-backwards history-search-multi-word
bindkey "^R" history-search-multi-word
