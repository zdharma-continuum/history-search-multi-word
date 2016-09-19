## Introduction

Binds `Ctrl-R` to a widget that searches for multiple keywords in `AND` fashion.
In other words, you can enter multiple words, and history entries that match
all of them will be found.

Video – view on [asciinema](https://asciinema.org/a/46371). You can resize the video by pressing `Ctrl-+` or `Cmd-+`.

[![asciicast](https://asciinema.org/a/46371.png)](https://asciinema.org/a/46371)

## News

* 19-09-2016
  - better immunity to [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
    and [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) – left
    and right cursor keys now work smoothly

* 25-05-2016
  - Cooperation with
    [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
    plugin
  - Configuration option to set page size, example use:

    ```zsh
    zstyle ":history-search-multi-word" page-size "5"
    ```

## Installation

**The plugin is "standalone"**, which means that only sourcing it is needed. So to
install, unpack `history-search-multi-word` somewhere and add

```zsh
source {where-hsmw-is}/history-search-multi-word.plugin.zsh
```

to `zshrc`.

If using a plugin manager, then `Zplugin` is recommended, but you can use any
other too, and also install with `Oh My Zsh` (by copying directory to
`~/.oh-my-zsh/custom/plugins`).


### [Zplugin](https://github.com/psprint/zplugin)

Add `zplugin load psprint/history-search-multi-word` to your `.zshrc` file.
Zplugin will handle cloning the plugin for you automatically the next time you
start zsh.

### Antigen

Add `antigen bundle psprint/history-search-multi-word` to your `.zshrc` file.
Antigen will handle cloning the plugin for you automatically the next time you
start zsh. You can also add the plugin to a running zsh with `antigen bundle
psprint/history-search-multi-word` for testing before adding it to your
`.zshrc`.

### Oh-My-Zsh

1. `cd ~/.oh-my-zsh/custom/plugins`
2. `git clone git@github.com:psprint/history-search-multi-word.git`
3. Add `history-search-multi-word` to your plugin list

### Zgen

Add `zgen load psprint/history-search-multi-word` to your .zshrc file in the same
place you're doing your other `zgen load` calls in.

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
