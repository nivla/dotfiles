# Path to your oh-my-zsh installation.
ZSH=~/.oh-my-zsh
#theme
ZSH_THEME="avit"

alias r="bin/rails"
alias ns="npm start"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

plugins=(git git bundler osx rake ruby)

# User configuration
export EDITOR='vim'
export PATH=$HOME/scripts:$HOME/.dotfiles/bin:$HOME/bin:/usr/local/bin:$PATH
export XENVIRONMENT="${HOME}/.Xresources"

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi


source $ZSH/oh-my-zsh.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/voyager/.sdkman"
[[ -s "/home/voyager/.sdkman/bin/sdkman-init.sh" ]] && source "/home/voyager/.sdkman/bin/sdkman-init.sh"
