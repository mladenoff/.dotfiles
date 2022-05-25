;# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/isakmladenoff/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

DEFAULT_USER=`whoami`

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls="ls -a"

alias rndt="open \"rndebugger://set-debugger-loc?host=localhost&port=8081\""
alias tempty="rm -rf $TMPDIR/react-* && rm -rf $TMPDIR/metro* && rm -rf $TMPDIR/haste* && rm -rf $TMPDIR/yarn* && rm -rf $TMPDIR/npm* && rm -rf $TMPDIR/jest*"

alias s="spotify"
alias ss="spotify status"

alias rs=./bin/rspec
alias rk=./bin/rake
alias spring=./bin/spring

alias dev="cd ~/dev"
alias core-phx="cd ~/dev/core-phx"
alias core="cd ~/dev/core"
alias mobile-phx="cd ~/dev/mobile-phx"
alias mobile="cd ~/dev/mobile"
alias portal="cd ~/dev/portal"
alias web-phx="cd ~/dev/web-phx"
alias web="cd ~/dev/web"
alias www="cd ~/dev/www"
alias .dotfiles="cd ~/.dotfiles"

alias dotfiles="code ~/.dotfiles"

alias be="bundle exec"
alias ber="bundle exec rspec"

alias swapip="node $HOME/.dotfiles/scripts/swap-ip-config-json.js"

alias branchify="$HOME/.dotfiles/scripts/branchify.rb"
alias b=branchify

alias datica-size="printf '\e[8;100;80t'"

# "Prune to main" - Delete all branches that are merged in `main` (but don't delete `main`, `development`, or `staging`)
function ptm {
  git fetch --all
  git branch --merged origin/main | egrep -v "(^\*|main|development|staging)" | xargs git branch --delete
}

# "Prune to staging" - Delete all branches that are merged in `staging` (but don't delete `main`, `development`, or `staging`)
function pts {
  git fetch --all
  git branch --merged origin/staging | egrep -v "(^\*|main|development|staging)" | xargs git branch --delete
}

function mkcd {
  mkdir "$1" && cd "$1";
}

function rcm {
  rubocop "$1" -c ~/.rubocop.yml
}

function rcma {
  rubocop "$1" -c ~/.rubocop.yml -a
}

function rcmu {
  git ls-files -m | xargs ls -1 2>/dev/null | xargs rubocop -c ~/.rubocop.yml
}

function rcmua {
  git ls-files -m | xargs ls -1 2>/dev/null | xargs rubocop -c ~/.rubocop.yml -a
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/usr/local/opt/sqlite/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Trying to get solarized directories from https://xuri.me/2013/11/09/use-solarized-color-scheme-in-os-x-terminal.html
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

eval "$(direnv hook zsh)"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Setting ANDROID_SDK for android-sdk
export ANDROID_SDK="${HOME}/Library/Android/sdk"

# Setting PATH to ANDROID_SDK emulator
export PATH="${ANDROID_SDK}/emulator:${PATH}"

export PATH="${HOME}/Library/Android/sdk/platform-tools":$PATH

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PIVOTAL_TOKEN='ad9f2cc0f09bb7281d15a23ea1a50490'

function swap1() {
  find . -name *$1* -maxdepth 1 -type f -exec zsh -c 'mv "$1" "${1/zo/bo}"' -- {} \;
}

function swap() {
  find . -name *$1* -maxdepth 1 -type f
}
export PATH="/usr/local/opt/postgresql@13/bin:$PATH"
