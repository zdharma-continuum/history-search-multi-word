# history-search-multi-word - zsh plugin

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Gitter](https://img.shields.io/gitter/room/zdharma-continuum/zinit.svg?style=flat-square)](https://gitter.im/zdharma-continuum/zinit)

Binds `Ctrl-R` to a widget that searches for multiple keywords in `AND` fashion. In other words, you
can enter multiple words, and history entries that match all of them will be found. The entries are
syntax highlighted.

Video – view on [asciinema](https://asciinema.org/a/88954). You can resize the video by pressing
`Ctrl-+` or `Cmd-+`.

[![asciicast](https://asciinema.org/a/88954.png)](https://asciinema.org/a/88954)

HSMW has feature called **context viewing** – see all occurrences of a command together with
surrounding commands:

[![asciicast](https://asciinema.org/a/155704.png)](https://asciinema.org/a/155704)

Set:

```zsh
  zstyle :plugin:history-search-multi-word reset-prompt-protect 1
```

to be able to use `zle reset-prompt` in your e.g. `sched` calls, in presence of
`zdharma-continuum/fast-syntax-highlighting`, `zsh-users/zsh-syntax-highlighting`,
`zsh-users/zsh-autosuggestions` and other plugins that hook up into Zshell by overloading Zle
widgets. You could e.g. use `sched` in following way:

```zsh
PROMPT=%B%F{yellow}%D{%H:%M:%S}%B%b%f
schedprompt() {
    zle && zle reset-prompt
    sched +1 schedprompt
}

zmodload -i zsh/sched
schedprompt
```

to refresh the clock in prompt every second. The `reset-prompt-protect` zstyle needs to be set to 1
for correct cooperation with HSMW. Or, you could use `zle .reset-prompt` (i.e. with the dot in
front) to call the original, not overloaded (by F-Sy-H, zsh-autosuggestsions, etc.) `reset-prompt`
widget.

## Installation

The plugin is **plugin manager agnostic**.

To install, clone the `history-search-multi-word` repository and add the following snippet to your
`.zshrc`

```zsh
source <LOCATION-WHERE-REPOSITORY>/history-search-multi-word.plugin.zsh
```

If using a plugin manager, then `Zinit` is recommended, but you can use any other too, and also
install with `Oh My Zsh` (by copying directory to `~/.oh-my-zsh/custom/plugins`).

### [Zinit](https://github.com/zdharma-continuum/zinit)

Add `zinit load zdharma-continuum/history-search-multi-word` to your `.zshrc` file. Zinit will
handle cloning the plugin for you automatically the next time you start zsh.

### Antigen

Add `antigen bundle zdharma-continuum/history-search-multi-word` to your `.zshrc` file. Antigen will
handle cloning the plugin for you automatically the next time you start zsh. You can also add the
plugin to a running zsh with `antigen bundle zdharma-continuum/history-search-multi-word` for
testing before adding it to your `.zshrc`.

### Oh-My-Zsh

1. `cd ~/.oh-my-zsh/custom/plugins`
1. `git clone git@github.com:zdharma-continuum/history-search-multi-word.git`
1. Add `history-search-multi-word` to your plugin list

### Zgen

Add `zgen load zdharma-continuum/history-search-multi-word` to your .zshrc file in the same place
you're doing your other `zgen load` calls in.

### [Sheldon](https://github.com/rossmacarthur/sheldon)

1. Run

```bash
sheldon add history-search-multi-word --github zdharma-continuum/history-search-multi-word
```

To add the `ctrl-R` keybind, add the following snippet to your `.zshrc`

```zsh
bindkey "^R" history-search-multi-word
```

### Arch Linux

1. Install
   [`zsh-history-search-multi-word-git`](https://aur.archlinux.org/packages/zsh-history-search-multi-word-git/)
   from the [AUR](https://wiki.archlinux.org/index.php/Arch_User_Repository).
1. Add the following to your `.zshrc`
   ```zsh
   source /usr/share/zsh/plugins/history-search-multi-word/history-search-multi-word.plugin.zsh
   ```
1. Start a new terminal session via `exec zsh`

## Options

```zsh
zstyle ":history-search-multi-word" highlight-color "fg=yellow,bold" # Color in which to highlight matched, searched text (default bg=17 on 256-color terminals)
zstyle ":history-search-multi-word" page-size "8"                    # Number of entries to show (default is $LINES/3)
zstyle ":plugin:history-search-multi-word" active "underline"        # Effect on active history entry. Try: standout, bold, bg=blue (default underline)
zstyle ":plugin:history-search-multi-word" check-paths "yes"         # Whether to check paths for existence and mark with magenta (default true)
zstyle ":plugin:history-search-multi-word" clear-on-cancel "no"      # Whether pressing Ctrl-C or ESC should clear entered query
zstyle ":plugin:history-search-multi-word" synhl "yes"               # Whether to perform syntax highlighting (default true)
```

### Syntax highlighting

Syntax highlighting is customized via `HSMW_HIGHLIGHT_STYLES` associative array. It has keys like
`reserved-word`, `alias`, `command`, `path`, etc. which are assigned with strings like
`fg=blue,bold`, to configure how given elements are to be colored. If you assign this array before
or after loading `hsmw` you will change the defaults. Complete list of available keys is
[at the beginning](https://github.com/zdharma-continuum/history-search-multi-word/blob/master/hsmw-highlight#L34-L62)
of `hsmw-highlight` file. Example `~/.zshrc` addition that sets `path` key – paths that exist will
be highlighted with background magenta, foreground white, bold:

```zsh
typeset -gA HSMW_HIGHLIGHT_STYLES
HSMW_HIGHLIGHT_STYLES[path]="bg=magenta,fg=white,bold"
```

#### Enable coloring of options of form "-o" and "--option", with cyan:

```zsh
typeset -gA HSMW_HIGHLIGHT_STYLES
HSMW_HIGHLIGHT_STYLES[double-hyphen-option]="fg=cyan"
HSMW_HIGHLIGHT_STYLES[single-hyphen-option]="fg=cyan"
```

#### 256 colors to highlight command separators (e.g., ;, &&, and ||):

```zsh
HSMW_HIGHLIGHT_STYLES[commandseparator]="fg=241,bg=17"
```

<!-- vim:set ft=markdown tw=100 fo+=1n: -->
