# vim

## save and quit

| command | action |
| --- | --- |
| `:q` | quit without saving |
| `:q!` | force quit without saving |
| `:wq` | quit with saving |
| `:wq!` | force quit with saving |

## insert and normal mode

| command | action |
| --- | --- |
| `i` | enter insert mode before cursor |
| `I` | enter insert mode before current line |
| `a` | enter insert mode behind cursor |
| `A` | enter insert mode behind current line |
| `o` | enter insert mode in new new-line under cursor |
| `O` | enter insert mode in new new-line above cursor |
| `esc` or `Ctrl` + `c` or `Ctrl` + `[` | enter normal mode |

## search and navigate

| command | action |
| --- | --- |
| `num` + command | amplify command `num` times |
| '/{pattern}' | search for `{pattern}` forward, use `n` and `N` to go to the next or last word that is searched, respectively |
| '?{pattern}' | same as `/` but searching backwards |
| `:num`, `enter` or `num`, `gg` or `num`, `G` | move cursor to line number `num` |
| `g` | go to top of file |
| `G` | go to end of file |
| `f{char}` | go to next occurrence of `{char}`, use `;`, `,` to continue to next, previous |
| `t{char}` | like `f{char}` but for previous occurrence |
| `*` | go to next occurrence of current word |
| `#` | go to previous occurrence of current word |
| `h` | move one character left |
| `j` | move one character down |
| `k` | move one character up |
| `l` | move one character right |
| `w` | move forward a word |
| `W` | move forward a WORD |
| `b` | move back word |
| `B` | move back WORD |
| `e` | move to the end of current word |

## copy, paste and undo

| command | action |
| --- | --- |
| `u` | undo last command |
| `ctrl` + `r` | redo last undo |
| `v` | highlight character, use movement keys to expand selection |
| `V` | highlight current line, use movement keys to expand selection |
| `x` | cut current character |
| `d` | cut highlighted character |
| `dd` | cut highlighted line |
| `y` | yank highlighted to clipboard |
| `yy` | yank line to clipboard |
| `p` | paste whatever is in clipboard |
| `P` | paste whatever is in clipboard to line above |


In vim selecting and editing is one step. This can be done with the gn text-object. Normally you will search for a word you want to change and the change the next found occurrence with cgn once and then use vim’s most powerful command the . (dot). Using . you can apply the change to the next word or skip one word with n which will jump to the next word

## vscode specials

| command | action |
| --- | --- |
| `gb` | adds another cursor on the next word | 

