## Introduction

Binds `Ctrl-R` to a widget that searches for multiple keywords in `AND` fashion.
In other words, you can enter multiple words, and history entries that match
all of them will be found. Video:

https://asciinema.org/a/46371

[![asciicast](https://asciinema.org/a/46371.png)](https://asciinema.org/a/46371)

## Installation

### [Zplugin](https://github.com/psprint/zplugin)

Add `zplugin load psprint/history-search-multi-word` to your `.zshrc` file.
Zplugin will handle cloning the plugin for you automatically the next time you
start zsh.

### [Antigen](https://github.com/zsh-users/antigen)

Add `antigen bundle psprint/history-search-multi-word` to your `.zshrc` file.
Antigen will handle cloning the plugin for you automatically the next time you
start zsh. You can also add the plugin to a running zsh with `antigen bundle
psprint/history-search-multi-word` for testing before adding it to your
`.zshrc`.

### [Oh-My-Zsh](http://ohmyz.sh/)

1. `cd ~/.oh-my-zsh/custom/plugins`
2. `git clone git@github.com:psprint/history-search-multi-word.git`
3. Add history-search-multi-word to your plugin list

### [Zgen](https://github.com/tarjoilija/zgen)

Add `zgen load psprint/history-search-multi-word` to your .zshrc file in the same function you're doing your other `zgen load` calls in.

### Manual installation

Copy the file `history-search-multi-word` to your `site-functions` directory and add:

```zsh
autoload history-search-multi-word
zle -N history-search-multi-word
zle -N history-search-multi-word-backwards history-search-multi-word
bindkey "^R" history-search-multi-word
```

to your `~/zshrc`.

## IRC Channel

Channel `#zplugin@freenode` is a support place for all author's projects. Connect to:
[chat.freenode.net:6697](ircs://chat.freenode.net:6697/%23zplugin) (SSL) or [chat.freenode.net:6667](irc://chat.freenode.net:6667/%23zplugin)
 and join #zplugin.

Following is a quick access via Webchat [![IRC](https://kiwiirc.com/buttons/chat.freenode.net/zplugin.png)](https://kiwiirc.com/client/chat.freenode.net:+6697/#zplugin)
