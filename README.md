## Introduction

Binds `Ctrl-R` to a widget that searches for multiple keywords in `AND` fashion.
In other words, you can enter multiple words, and history entries that match
all of them will be found. Video:

https://asciinema.org/a/46341

[![asciicast](https://asciinema.org/a/46341.png)](https://asciinema.org/a/46341)

## Installation

Use as plugin or copy to `site-functions` and add:

```zsh
autoload hsmw-process-buffer history-search-multi-word
zle -N history-search-multi-word
zle -N history-search-multi-word-backwards history-search-multi-word
bindkey "^R" history-search-multi-word
```

to `zshrc`.
