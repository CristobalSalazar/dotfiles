export PATH=$HOME/bin:/usr/local/bin:$PATH # home binaries
export PATH=$PATH:/Applications/flutter/bin # flutter
export PATH=$PATH:$HOME/.cargo/bin # rust
export EDITOR=/usr/local/bin/nvim  # neovim editor

# Path to your oh-my-zsh installation.
export ZSH=$ZDOTDIR/.oh-my-zsh

# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="salza"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

source $ZSH/oh-my-zsh.sh 
# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
# Compilation flags
export ARCHFLAGS="-arch x86_64"
