#!/bin/sh

#
# This file runs the highlighter on a specified file
# i.e. parses the file with the highlighter. Outputs
# running time (stderr) and resulting region_highlight
# (file parse.out, or $2 if given).
#
# Can be also run in line-wise mode on own input (-o
# option in $1), no region_highlight file then.
#

[[ -z "$ZSH_VERSION" ]] && exec /usr/bin/env zsh -f -c "source \"$0\" \"$1\" \"$2\" \"$3\""

ZERO="${(%):-%N}"

if [[ -e "${ZERO}/../hsmw-highlight" ]]; then
    source "${ZERO}/../hsmw-highlight"
elif [[ -e "../hsmw-highlight" ]]; then
    source "../hsmw-highlight"
elif [[ -e "${ZERO}/hsmw-highlight" ]]; then
    source "${ZERO}/hsmw-highlight"
elif [[ -e "./hsmw-highlight" ]]; then
    source "./hsmw-highlight"
else
    print -u2 "Could not find hsmw-highlight, aborting"
    exit 1
fi

zmodload zsh/zprof
autoload is-at-least

setopt interactive_comments

# Own input?
if [[ "$1" = "-o" || "$1" = "-oo" ]]; then
    typeset -a input
    if [[ "$1" = "-o" ]]; then
        input+=( "./parse.zsh ../hsmw-highlight parse2.out" )
        input+=( "rm -f parse*.out" )
        input+=( "./mh-parse.zsh ../hsmw-highlight > out" )
        input+=( "if [[ -o multibyte ]]; then echo multibyte is set; fi" )
        input+=( "[[ \"a\" = *[[:alpha:]_-][[:alpha:]]# ]] && echo yes" )
        input+=( 'git tag -a v0.98 -m "Syntax highlighting of the history entries"' )
        input+=( 'func() { echo "a" >! phist2.db; echo "b" >>! phist2.db; fc -Rap "phist2.db"; list=( ${history[@]} ); echo "${history[1]}"; }' )
    else
        input+=( 'typeset -a list\n() {\necho "a" >! phist2.db\necho "b" >>! phist2.db\nfc -Rap "phist2.db"\nlist=( ${history[@]} )\necho "${history[2]}"\necho "${history[1]}"\necho "${#history}";\ninteger size="${#history}"\nsize+=1\necho "$size" / "${history[$size]}"\nlist=( "${history[$size]}" ${history[@]} )\n}' )
        input+=( 'typeset -a list\n() {\necho "a" >! phist2.db\necho "b" >>! phist2.db\nfc -Rap "phist2.db"\nlist=( ${history[@]} )\necho "${history[2]}"\necho "${history[1]}"\necho "${#history}";\ninteger size="${#history}"\nsize+=1\necho "$size" / "${history[$size]}"\nlist=( "${history[$size]}" ${history[@]} )\n}' )
        input+=( 'typeset -a list\n() {\necho "a" >! phist2.db\necho "b" >>! phist2.db\nfc -Rap "phist2.db"\nlist=( ${history[@]} )\necho "${history[2]}"\necho "${history[1]}"\necho "${#history}";\ninteger size="${#history}"\nsize+=1\necho "$size" / "${history[$size]}"\nlist=( "${history[$size]}" ${history[@]} )\n}' )
        input+=( 'typeset -a list\n() {\necho "a" >! phist2.db\necho "b" >>! phist2.db\nfc -Rap "phist2.db"\nlist=( ${history[@]} )\necho "${history[2]}"\necho "${history[1]}"\necho "${#history}";\ninteger size="${#history}"\nsize+=1\necho "$size" / "${history[$size]}"\nlist=( "${history[$size]}" ${history[@]} )\n}' )
        input+=( 'typeset -a list\n() {\necho "a" >! phist2.db\necho "b" >>! phist2.db\nfc -Rap "phist2.db"\nlist=( ${history[@]} )\necho "${history[2]}"\necho "${history[1]}"\necho "${#history}";\ninteger size="${#history}"\nsize+=1\necho "$size" / "${history[$size]}"\nlist=( "${history[$size]}" ${history[@]} )\n}' )
        input+=( 'typeset -a list\n() {\necho "a" >! phist2.db\necho "b" >>! phist2.db\nfc -Rap "phist2.db"\nlist=( ${history[@]} )\necho "${history[2]}"\necho "${history[1]}"\necho "${#history}";\ninteger size="${#history}"\nsize+=1\necho "$size" / "${history[$size]}"\nlist=( "${history[$size]}" ${history[@]} )\n}' )
        input+=( 'typeset -a list\n() {\necho "a" >! phist2.db\necho "b" >>! phist2.db\nfc -Rap "phist2.db"\nlist=( ${history[@]} )\necho "${history[2]}"\necho "${history[1]}"\necho "${#history}";\ninteger size="${#history}"\nsize+=1\necho "$size" / "${history[$size]}"\nlist=( "${history[$size]}" ${history[@]} )\n}' )
    fi

    typeset -a long_input
    integer i
    for (( i=1; i<= 50; i ++ )); do
        long_input+=( "${input[@]}" )
    done

    typeset -F SECONDS
    SECONDS=0

    -hsmw-highlight-init

    local right_brace_is_recognised_everywhere
    integer path_dirs_was_set multi_func_def ointeractive_comments
    -hsmw-highlight-fill-option-variables

    local line
    for line in "${long_input[@]}"; do
        reply=( )
        -hsmw-highlight-process "$line"
    done

    print "Running time: $SECONDS"
    zprof | head
# File input?
elif [[ -r "$1" ]]; then
    # Load from given file
    local buf="$(<$1)"

    typeset -F SECONDS
    SECONDS=0

    reply=( )
    -hsmw-highlight-init

    local right_brace_is_recognised_everywhere
    integer path_dirs_was_set multi_func_def ointeractive_comments
    -hsmw-highlight-fill-option-variables

    -hsmw-highlight-process "$buf"

    print "Running time: $SECONDS"
    zprof | head

    # This output can be diffed to detect changes in operation
    if [[ -z "$2" ]]; then
        print -rl -- "${reply[@]}" >! out.parse
    else
        print -rl -- "${reply[@]}" >! "$2"
    fi
else
    if [[ -z "$1" ]]; then
        print -u2 "Usage: ./mh-parse.zsh {to-parse file} [region_highlight output file]"
        exit 2
    else
        print -u2 "Unreadable to-parse file \`$1', aborting"
        exit 3
    fi
fi

exit 0

# vim:ft=zsh
