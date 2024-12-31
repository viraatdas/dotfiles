# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/viraatd/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="afowler"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
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
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    zsh-z
    zsh-syntax-highlighting
    poetry
)

export ZSH_AUTOSUGGEST_STRATEGY=(
    history
    completion
)

bindkey '^[\r' autosuggest-accept

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH=$HOME/.toolbox/bin:$PATH

ZSH_DISABLE_COMPFIX="true"

# functions 
view_packages () {
    TAP=amazon/homebrew-amazon; \
  TAP_PREFIX=$(brew --prefix)/Homebrew/Library/Taps; \
  ls $TAP_PREFIX/$TAP/Formula/*.rb 2>/dev/null || ls $TAP_PREFIX/$TAP/*.rb 2>/dev/null | \
  xargs -I{} basename {} .rbI
}

export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-15.jdk/Contents/Home

alias km='kinit && mwinit' 
alias kr='kinit && mwinit && ssh viraatd-clouddesk.aka.corp.amazon.com'
alias bb='brazil-build'


alias idea='open -na "IntelliJ IDEA.app"'
alias typora='open -a typora'


function run_unison() {
#  find /Users/viraatd/.unison/ -type f -not -name 'default.prf' -delete
 # ssh viraatd-clouddesk.aka.corp.amazon.com 'find /home/viraatd/.unison/ -type f -not -name "default.prf" -delete'

  while true
  do
    unison -ui text
    # sleep 0.3
  done
}

alias km_init='km && run_unison'

export JAVA_TOOLS_OPTIONS="-Dlog4j2.formatMsgNoLookups=true"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/usr/local/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/usr/local/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<


export PATH="$PATH:/Users/viraatd/.bin"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(/opt/homebrew/bin/brew shellenv)"
# Set up mise for runtime management
eval "$(mise activate zsh)"

function ssh-ec2() {
  if [[ $# -eq 0 ]]; then
    echo "Usage: ssh-ec2 <instance>"
    return 1
  fi

  local instance=$1
  local ssh_key="/Users/viraatd/Documents/new-llm.pem"
  local ssh_user="ec2-user"

  ssh -i "$ssh_key" "${ssh_user}@${instance}"
}

function ssh-ec2-print() {
  if [[ $# -eq 0 ]]; then
    echo "Usage: ssh-ec2 <instance>"
    return 1
  fi

  local instance=$1
  local ssh_key="/Users/viraatd/Documents/new-llm.pem"
  local ssh_user="ec2-user"

  # This will only print the command instead of executing it
  echo "ssh -i \"$ssh_key\" \"${ssh_user}@${instance}\""
}

alias pip3.10="python3.10 -m pip"
function gt() {
	git add .
	git commit -m $1
	git push
}
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3

[ -f "/Users/viraatd/.ghcup/env" ] && . "/Users/viraatd/.ghcup/env" # ghcup-env

export NODE_OPTIONS=--openssl-legacy-provider

function rm() {
    if [[ $1 == "-rf" ]]; then
          shift
          del "$@"
      else
          del "$@"
      fi
 }
# export PATH="/Users/viraatd/.local/bin:$PATH"

# export PATH="$HOME/.pyenv/shims:$PATH"
# eval "$(pyenv init --path)"
