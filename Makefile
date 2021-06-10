include links.mk

MY_CONF := ~/dotfiles

all: omzsh nvim

nvim: alacritty initvim tmux

omzsh: zsh avit-theme

alacritty: $(MY_CONF)/$(ALACRITTY) | .config/alacritty
	ln -fs $(MY_CONF)/$(ALACRITTY) $(LN_ALACRITTY)

gitmux: $(MY_CONF)/$(GITMUX)
	ln -fs $(MY_CONF)/$(GITMUX) $(LN_GITMUX)

initvim: $(MY_CONF)/$(INITVIM) | .config/nvim
	ln -fs $(MY_CONF)/$(INITVIM) $(LN_INITVIM)

tmux: $(MY_CONF)/$(TMUX)
	ln -fs $(MY_CONF)/$(TMUX) $(LN_TMUX)

zsh: $(MY_CONF)/$(ZSH)
	ln -fs $(MY_CONF)/$(ZSH) $(LN_ZSH)

avit-theme: $(MY_CONF)/$(AVIT_THEME)
	ln -fs $(MY_CONF)/$(AVIT_THEME) $(LN_AVIT_THEME)

.config/nvim:
	mkdir -p ~/$@

.config/alacritty:
	mkdir -p ~/$@

.PHONY: all nvim omzsh .config .config/nvim
