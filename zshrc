# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/
#theme
ZSH_THEME="wezm"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

plugins=(git git bundler osx rake ruby)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH


ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

