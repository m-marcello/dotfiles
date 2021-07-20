include links.mk

MY_CONF := $(HOME)/dotfiles

all: omzsh nvim git terminal

terminal: alacritty tmux

omzsh: zsh avit-theme

git: $(MY_CONF)/$(GIT) git-dusk
	ln -fs $< $(LN_GIT)

git-dusk: $(MY_CONF)/$(GIT_DUSK)
	ln -fs $< $(LN_GIT_DUSK)

alacritty: $(MY_CONF)/$(ALACRITTY) | .config/alacritty
	ln -fs $< $(LN_ALACRITTY)

nvim: $(MY_CONF)/$(INITVIM) | .config/nvim
	ln -fs $< $(LN_INITVIM)

tmux: $(MY_CONF)/$(TMUX)
	ln -fs $< $(LN_TMUX)

zsh: $(MY_CONF)/$(ZSH)
	ln -fs $< $(LN_ZSH)

avit-theme: $(MY_CONF)/$(AVIT_THEME)
	ln -fs $< $(LN_AVIT_THEME)

.config/nvim:
	mkdir -p ~/$@

.config/alacritty:
	mkdir -p ~/$@

.PHONY: all nvim omzsh .config .config/nvim
