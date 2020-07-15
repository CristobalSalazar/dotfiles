# ENV
export PATH=$HOME/bin:/usr/local/bin:$PATH # home binaries
export PATH=$PATH:/Applications/flutter/bin # flutter
export PATH=$PATH:$HOME/.cargo/bin # rust
export EDITOR=/usr/local/bin/nvim  # neovim editor
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"
  
# ZSH
plugins=()
export ZSH=$ZDOTDIR/.oh-my-zsh
export ZSH_CUSTOM=$ZDOTDIR/custom
export ZSH_THEME="salza"
source $ZSH/oh-my-zsh.sh 


