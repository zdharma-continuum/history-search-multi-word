#!/bin/sh

#
# This file runs the highlighter on a specified file
# i.e. parses the file with the highlighter. Outputs
# running time (stderr) and resulting region_highlight
# (file parse.out, or $2 if given).
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

if [[ -r "$1" ]]; then
    # Load from given file
    local buf="$(<$1)"

    typeset -F SECONDS
    SECONDS=0

    reply=( )
    -hsmw-highlight-init
    -hsmw-highlight-process "$buf"

    print "Running time: $SECONDS"

    # This output can be diffed to detect changes in operation
    if [[ -z "$2" ]]; then
        print -rl -- "${reply[@]}" >! parse.out
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
