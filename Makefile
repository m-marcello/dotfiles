include links.mk

DOTFILES := $(HOME)/dotfiles

all: shell $(LN_GIT) $(LN_INITVIM) $(LN_COC) $(LN_TMUX)

# terminal: alacritty tmux

shell: $(LN_ZSH) $(LN_INPUTRC) $(LN_AVIT_THEME) $(LN_ALIASES)

$(LN_GIT): $(DOTFILES)/$(GIT) $(LN_GIT_DUSK)
	ln -fs $< $@

$(LN_GIT_DUSK): $(DOTFILES)/$(GIT_DUSK)
	ln -fs $< $@

$(LN_INITVIM): $(DOTFILES)/$(INITVIM) | $(HOME)/.config/nvim
	ln -fs $< $@

$(LN_COC): $(DOTFILES)/$(COC)
	ln -fs $< $@

$(LN_TMUX): $(DOTFILES)/$(TMUX)
	ln -fs $< $@

$(LN_ZSH): $(DOTFILES)/$(ZSH)
	ln -fs $< $@

$(LN_INPUTRC): $(DOTFILES)/$(INPUTRC)
	ln -fs $< $@

$(LN_AVIT_THEME): $(DOTFILES)/$(AVIT_THEME)
	ln -fs $< $@

$(LN_ALIASES): $(DOTFILES)/$(ALIASES)
	ln -fs $< $@

$(HOME)/.config/nvim:
	mkdir -p ~/$@

# .config/alacritty:
	# mkdir -p ~/$@

.PHONY: all shell
