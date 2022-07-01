#!/usr/bin/env zsh
#
# -*- mode: sh; sh-indentation: 2; indent-tabs-mode: nil; sh-basic-offset: 2; -*-
#
# Copyright (c) 2016-2020 Sebastian Gniazdowski and contributors
# Copyright (c) 2021-2022 zdharma-continuum and contributors

#
# No plugin manager is needed to use this file. All that is needed is adding:
#   source {where-unpacked}/history-search-multi-word.plugin.zsh
# to ~/.zshrc.
#

# According to the standard:
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

HSMW_REPO_DIR="${0:h}"

if [[ ${zsh_loaded_plugins[-1]} != */history-search-multi-word && -z ${fpath[(r)${0:h}]} ]]
then
  fpath+=( "${0:h}" )
fi

autoload history-search-multi-word hsmw-context-main
zle -N history-search-multi-word
zle -N history-search-multi-word-backwards history-search-multi-word
zle -N history-search-multi-word-pbackwards history-search-multi-word
zle -N history-search-multi-word-pforwards history-search-multi-word
[[ ${+termcap[Co]} = 1 && ${termcap[Co]} = 256 ]] && {
  zstyle -s ":history-search-multi-word" highlight-color tmp || \
    zstyle ":history-search-multi-word" highlight-color "bg=17"
  typeset -gA HSMW_HIGHLIGHT_STYLES
  [[ ${HSMW_HIGHLIGHT_STYLES[variable]} = none ]] && \
    HSMW_HIGHLIGHT_STYLES[variable]="fg=112"
}
bindkey "^R" history-search-multi-word
