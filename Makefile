include links.mk

DOTFILES := $(HOME)/dotfiles

all: shell $(LN_GIT) $(LN_NVIM_KICKSTART) $(LN_TMUX)

# terminal: alacritty tmux

shell: $(LN_ZSH) $(LN_INPUTRC) $(LN_AVIT_THEME) $(LN_ALIASES)

git: $(DOTFILES)/$(GIT) $(LN_GIT_DUSK)
	ln -fs $< $(LN_GIT)

git_dusk: $(DOTFILES)/$(GIT_DUSK)
	ln -fs $< $(LN_GIT_DUSK)

# kickstart is not in the dotfiles dir
nvim_kickstart: $(HOME)/$(NVIM_KICKSTART)
	ln -fs $< $(LN_NVIM_KICKSTART)

init_vim: $(DOTFILES)/$(INITVIM) | $(HOME)/.config/nvim
	ln -fs $< $(LN_INITVIM)

coc: $(DOTFILES)/$(COC)
	ln -fs $< $(LN_COC)

tmux: $(DOTFILES)/$(TMUX)
	ln -fs $< $(LN_TMUX)

zsh: $(DOTFILES)/$(ZSH)
	ln -fs $< $(LN_ZSH)

inputrc: $(DOTFILES)/$(INPUTRC)
	ln -fs $< $(LN_INPUTRC)

avit_theme: $(DOTFILES)/$(AVIT_THEME)
	ln -fs $< $(LN_AVIT_THEME)

aliases: $(DOTFILES)/$(ALIASES)
	ln -fs $< $(LN_ALIASES)

$(HOME)/.config/nvim:
	mkdir -p ~/$@

# .config/alacritty:
	# mkdir -p ~/$@

.PHONY: all shell
