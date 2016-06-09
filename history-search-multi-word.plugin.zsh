#
# No plugin manager is needed to use this file. All that is needed is adding:
#   source {where-unpacked}/history-search-multi-word.plugin.zsh
# to ~/.zshrc.
#

# This gives immunity to functionargzero being unset
# _ will be set to last argument to source builtin
PLUGIN_UNDERSCORE="$_"
[ "$0" != "$PLUGIN_UNDERSCORE" ] && 0="$PLUGIN_UNDERSCORE"

REPO_DIR="${0%/*}"
if [[ -z "$ZPLG_CUR_PLUGIN" && "${fpath[(r)$REPO_DIR]}" != $REPO_DIR ]]; then
    fpath+=( "$REPO_DIR" )
fi

autoload history-search-multi-word
zle -N history-search-multi-word
zle -N history-search-multi-word-backwards history-search-multi-word
bindkey "^R" history-search-multi-word
