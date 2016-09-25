ZSH=$HOME/.oh-my-zsh
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/tbrown/.oh-my-zsh

export LESS_TERMCAP_mb=$'\E[01;31m'      # begin blinking
export LESS_TERMCAP_mb=$'\E[01;38;5;74m' # begin bold
export LESS_TERMCAP_mb=$'\E[0m'          # end mode
export LESS_TERMCAP_mb=$'\E[0m'          # end standout-mode
export LESS_TERMCAP_mb=$'\E[38;5;246m'   # begin standout-mode - info box
export LESS_TERMCAP_mb=$'\E[0m'          # end underline
export LESS_TERMCAP_mb=$'\E[04;38;5;146' # begin underline

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/ehemes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="cloud"
#ZSH_THEME="candy"
ZSH_THEME="pixel67-theme"
source $ZSH/oh-my-zsh.sh

# Enable online help for ZSH
# unalias run help
# autoload run help
# HELPDIR=/usr/local/share/zsh/help

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx rails ruby git github node npm brew zsh-syntax-highlighting)

# User configuration

export LANG=en_US.UTF-8


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source ~/.aliases

# PHP7 configuration
export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"

export PATH="/usr/local/sbin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"
#export PATH"/usr/local/mysql/bin:$PATH"

export PATH=$PATH:/usr/local/opt/go/libexec/bin

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

unalias mysql

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/mysql/bin:/usr/X11/bin

export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export NVM_DIR="/Users/tbrown/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
