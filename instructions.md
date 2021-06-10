# Requirements

## for neovim from [this tutorial](https://dev.to/casonadams/ditch-vscode-for-neovim-25ca)
- [neovim](https://neovim.io/)
- [git](https://git-scm.com/download/)
- [tmux](https://github.com/tmux/tmux)
- [alacritty](https://github.com/alacritty/alacritty)
- [vim-plug](https://github.com/junegunn/vim-plug)
- ([gitmux](https://github.com/arl/gitmux) (save to 'usr/local/bin' in PATH))
- [JetBrains Mono](https://www.jetbrains.com/lp/mono/)

# Setup

Enter directory
```
$ cd dotfiles
```

Create links
```
$ make
```

Install neovim plugins
```
$ nvim +'PlugInstall' +qa --headless
```

Enter tmux by typing `tmux` in the terminal and install tmux plugins by hitting `ctrl+b I`

