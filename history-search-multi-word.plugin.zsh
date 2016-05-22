autoload hsmw-process-buffer history-search-multi-word
zle -N history-search-multi-word
zle -N history-search-multi-word-backwards history-search-multi-word
bindkey "^R" history-search-multi-word
