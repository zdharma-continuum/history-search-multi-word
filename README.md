## Introduction

Binds `Ctrl-R` to a widget that searches for multiple keywords in `AND` fashion.
In other words, you can enter multiple words, and history entries that match
all of them will be found. Video:

https://asciinema.org/a/46371

[![asciicast](https://asciinema.org/a/46371.png)](https://asciinema.org/a/46371)

## Installation

Use as plugin or copy to `site-functions` and add:

```zsh
autoload history-search-multi-word
zle -N history-search-multi-word
zle -N history-search-multi-word-backwards history-search-multi-word
bindkey "^R" history-search-multi-word
```

to `zshrc`.

## IRC Channel

Channel `#zplugin@freenode` is a support place for all author's projects. Connect to:
[chat.freenode.net:6697](ircs://chat.freenode.net:6697/%23zplugin) (SSL) or [chat.freenode.net:6667](irc://chat.freenode.net:6667/%23zplugin)
 and join #zplugin.

Following is a quick access via Webchat [![IRC](https://kiwiirc.com/buttons/chat.freenode.net/zplugin.png)](https://kiwiirc.com/client/chat.freenode.net:+6697/#zplugin)
