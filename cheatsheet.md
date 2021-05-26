# general

| shortcut | action |
| --- | --- |
| `Alt` + `←`/`→`/`↑`/`↓` | align window right/left/upper/lower half fo the screen |
| `Alt` + `num` | go to desktop `num` |
| `Alt` + `⇧` + `num` | move window to desktop `num` |

# git

| alias | command |
| --- | --- |
| ga | git **add** |
| gc | git **commit -v** |
| gc! | git **commit -v --amend** |
| gcn! | git **commit -v --no-edit --amend** |
| gca | git **commit -v -a** |
| gca! | git **commit -v -a --amend** |
| gcan! | git **commit -v -a --no-edit --amend** |
| gco | git **checkout** |
| gcb | git **checkout -b** |
| gcm | git **checkout $(git_main_branch)** |
| gb | git **branch** |
| gba | git **branch -a** |
| gbd | git **branch -d** |
| gd | git **diff** |
| gl | git **pull** |
| ggl | git **pull origin $(current_branch)** |
| gp | git **push** |
| ggp | git **push origin $(current_branch)** |
| glg | git **log --stat** |
| glgga | git **log --graph --decorate --all** |
| glog | git **log --oneline --decorate --graph** |
| gm | git **merge** |
| gmom | git **merge origin/$(git_main_branch)** |
| grb | git **rebase** |
| grbi | git **rebase -i** |
| grh | git **reset** |
| grm | git **rm** |
| gst | git **status** |
| gsta | git **stash** |
| gstp | git **stash pop** |


# VSCode

## general

| shortcut | action |
| --- | --- |
| `Ctrl` + `⇧` + `P` | open pallette |
| `Ctrl` + `⇧` + `N` | open new instance |

## editor management

| shortcut | action |
| --- | --- |
| `Ctrl` + `P` | quick open, go to file |
| `Ctrl` + `O` | open file |
| `Ctrl` + `N` | open new file |
| `Ctrl` + `W` | close tab / window |
| `Ctrl` + `\` | split editor |
| `Ctrl` + `Tab` | cycle tabs |
| `Ctrl` + `⇧` + `Tab` | navigate editor history |
| `Ctrl` + `1`/`2`/`3` | focus into 1st, 2nd or 3rd editor group |
| `Ctrl` + `K` `Z` | enter/exit zen mode |


## editing

| shortcut | action |
| --- | --- |
| `Ctrl` + `L` | select current line |
| `Ctrl` + `D` | select word, select next instance |
| `Ctrl` + `G` `num` | go to line `num` |
| `↑`/`↓` | move cursor up/down |
| `Ctrl` + `↑`/`↓` | scroll up/down |
| `Ctrl` + `/` | comment/uncomment |
| `Ctrl` + `J` | open/close terminal |
| `Ctrl` + `F` | search |
| `Ctrl` + `H` | search and replace |
| `Ctrl` + `Home` | go to beginning of file |
| `Home` | go to beginning of line |
| `Ctrl` + `End` | go to end of file |
| `End` | go to end of line |
| `Ctrl` + `[`/`]` | outdent/indent line |
| `Alt` + `↑`/`↓` | move line up/down |
| `Alt` + `⇧` + `↑`/`↓` | copy line up/down |

## multi cursor

| shortcut | action |
| --- | --- |
| `Ctrl` + `⇧` + `↑`/`↓` | insert cursor above/below |
| `Ctrl` + `D` | select word, select next occurrence |
| `Ctrl` + `⇧` + `L` | select all occurrences |
| `Ctrl` + `U` | undo last cursor addition |
| `Ctrl` + `Esc` | exit multi cursor mode |

# Firefox

| shortcut | action |
| --- | --- |
| `Ctrl` + `N` | open new window |
| `Ctrl` + `T` | open new tab |
| `Ctrl` + `W` | close tab / window |
| `Ctrl` + `Tab` | cycle tabs |

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
| `gh` | equivalent of mouse hovering to check e.g. for error messages |