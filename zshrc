# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set list of themes to pick from when loading at random
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="avit_moana"
# another good theme might be the following, although it is a bit cluttered
# ZSH_THEME="jonathan"

# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rust vi-mode fzf)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# My additions

# Load aliases
source $HOME/.aliases

# add libcriterion to library search path
# For using c-criterion unit tests on apple
export LD_LIBRARY_PATH="/usr/local/lib:/usr/lib:$HOME/.brew:$LD_LIBRARY_PATH"

# add cargo binaries to binary search path
export PATH="$HOME/.cargo/bin:$PATH"

# set terminal colors to 256 not set because it breaks gruvbox colorscheme
# colors are set in tmux configurations instead
#export TERM=xterm-256color

# show cheatsheets
function cs() {
	echo "show cheatsheet for $1"
	bat $HOME/dotfiles/cheatsheets/$1.md
}

# Load Homebrew config script when on OS X
if [[ $(uname -s) == Darwin ]]; then
	# add homebrew binary to search path
	export PATH=$PATH:/opt/homebrew/bin
fi

if [ -f /etc/zsh.cnf ]; then
 . /etc/zsh.cnf
fi

# ----- For vi-mode plugin
# Set indication when in normal mode
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
# Change prompt to line when in insert mode
#VI_MODE_SET_CURSOR=true

# export LIBRARY_PATH="/opt/homebrew/opt/z3/lib:$LIBRARY_PATH"
# export LD_LIBRARY_PATH="/opt/homebrew/opt/z3/lib:$LD_LIBRARY_PATH"
# export C_INCLUDE_PATH="/opt/homebrew/opt/z3/include:$C_INCLUDE_PATH"
# export CPLUS_INCLUDE_PATH="/opt/homebrew/opt/z3/include:$CPLUS_INCLUDE_PATH"
# export LDFLAGS="-L/opt/homebrew/opt/z3/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/z3/include"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
