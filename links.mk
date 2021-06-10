ALACRITTY := alacritty.yml
GITMUX := gitmux.conf
INITVIM := init.vim
TMUX := tmux.conf
ZSH := zshrc
AVIT_THEME := avit.zsh-theme
GIT := gitconfig
GIT_DUSK := gitconfig-dusk

LN_ALACRITTY := $(HOME)/.config/alacritty/$(ALACRITTY)
LN_GITMUX := $(HOME)/.$(GITMUX)
LN_INITVIM := $(HOME)/.config/nvim/$(INITVIM)
LN_TMUX := $(HOME)/.$(TMUX)
LN_ZSH := $(HOME)/.$(ZSH)
LN_AVIT_THEME := $(HOME)/.oh-my-zsh/themes/$(AVIT_THEME)
LN_GIT := $(HOME)/.$(GIT)
LN_GIT_DUSK := $(HOME)/.$(GIT_DUSK)

