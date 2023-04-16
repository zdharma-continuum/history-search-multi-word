## 14-07-2020

- If an `[…]` string will occur in the search query, it'll be interpreted as pattern. So that it's possible to enter as
  the search query e.g.: `print ["a-zA-Z0-9_-]` or `print [^[:alpha:]]`, etc.

## 28-10-2019

- `^` – if first – matches beginning of the command's string, $ – if last – its end. So that it's possible to enter
  `'^ls'` and have only commands starting with `ls` matched.

## 25-05-2018

- Hash holding paths that shouldn't be grepped (globbed) – blacklist for slow disks, mounts, etc.:

  ```zsh
  typeset -gA FAST_BLIST_PATTERNS
  FAST_BLIST_PATTERNS[/mount/nfs1/*]=1
  FAST_BLIST_PATTERNS[/mount/disk2/*]=1
  ```

## 13-06-2017

- Canceling search doesn't clear entered query. Change to previous behavior via:

  ```zsh
  zstyle ":plugin:history-search-multi-word" clear-on-cancel "yes"
  ```

## 12-04-2017

- Page size can be relative to screen height, e.g.:

  ```zsh
  zstyle ":history-search-multi-word" page-size "LINES/4"
  ```

## 05-04-2017

- 17% performance optimization

## 27-01-2017

- Input-driven case-sensivity of search – if your query contains capital latin letters, search will be case-sensitive

## 12-11-2016

- HSMW can now show context of selected history entry! Just hit `Ctrl-K`, [video](https://asciinema.org/a/92516)
- More performance optimizations

## 31-10-2016

- Newlines do not disturb the parser anymore, and are also highlighted with a dark color –
  [video](https://asciinema.org/a/91159)

## 27-10-2016

- New optimizations – **30%** speed up of syntax highlighting!
- Architectural change – syntax highlighting is now computed rarely, so any possible performance problems are now
  solved, in advance!

## 24-10-2016

- Workaround for Zsh versions like 5.0.2 has been added – **Ctrl-V** and **ESC** cancel search. On such Zsh versions
  Ctrl-C might not work. Fully problem-free Zsh version will be the upcoming 5.3, where I have together with Zsh Hackers
  fully fixed the Ctrl-C issue.

## 22-10-2016

- Search process has been optimized by 20%! History sizes like 100000 are now supported.
- Active history entry can be `underline`, `standout` (i.e. inverse video), `bold`, `bg=blue`, etc. with the new Zstyle
  `:plugin:history-search-multi-word / active` (see Zstyles section) – [video](https://asciinema.org/a/90214).

## 16-10-2016

- More optimizations of syntax highlighting (40% in total for the two days) – new video above.

## 15-10-2016

- The compact, already optimized (by me) [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
  part has been further optimized by 21%! Also, more tokens are highlighted – variable expressions like
  `"${(@)var[1,3]}"` (when quoted).

## 11-10-2016

- Syntax highlighting of history – adapted, fine crafted, **small** part of
  [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) to color what `hsmw` shows:

  ![syntax highlighting](http://imagizer.imageshack.us/a/img921/1503/bMAF59.gif)

## 20-09-2016

- Keys Page Up and Page Down work and page-wise move along history. Also, `Ctrl-P`, `Ctrl-N` move to previous and next
  entries.

## 19-09-2016

- Better immunity to [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) and
  [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) – home, end, left and right cursor
  keys now work smoothly.

## 25-05-2016

- Cooperation with [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) plugin

- Configuration option to set page size, example use:

  ```zsh
  zstyle ":history-search-multi-word" page-size "5"
  ```
