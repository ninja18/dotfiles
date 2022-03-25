# Export variables
export PATH=/usr/local/texlive/2020/bin/x86_64-darwin:$PATH
export PATH=/Users/ninja/Documents/Others/sage/other_comps:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export GOROOT="/usr/local/go"
export GOPATH="$HOME/go"
export PATH="$GOROOT/bin:$PATH"
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export VISUAL=nvim
export EDITOR=nvim
#export JAVA_HOME=$(/usr/libexec/java_home -v 12)
export ZSH="/Users/ninja/.oh-my-zsh"
export MY_CONFIG="$HOME/Documents/my_config"
export NVM_DIR="$HOME/.nvm"
export ANDROID_HOME=/Users/ninja/Library/Android/sdk
export ANDROID_SDK_ROOT=/Users/ninja/Library/Android/sdk
export ANDROID_AVD_HOME=/Users/ninja/.android/avd
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export TALISMAN_HOME=/Users/ninja/.talisman/bin
alias talisman=$TALISMAN_HOME/talisman_darwin_amd64
export TALISMAN_INTERACTIVE=true
export ZK_NOTEBOOK_DIR="/Users/ninja/Documents/notes"
ZSH_THEME="typewritten"

# Plugins

plugins=(git)
plugins=(git z)
plugins=(zsh-autosuggestions)


# Functions

_fzf_compgen_path() {
    # overriding the fzf default find command to use ripgrep 
    rg --files --hidden --glob '!.git' --glob '!Library' --glob '!Music'
}

# Source plugin files

source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. /usr/local/etc/profile.d/z.sh

# Aliases
alias lsf='function _lsf(){ (cd $(dirname "$1") && echo $(pwd)/$(basename "$1")) };_lsf' # to print absolute path of file
alias config='/usr/local/bin/git --git-dir=$MY_CONFIG/dotfiles --work-tree=$HOME' # git command for dotfiles and system config

# Custom key bindings

bindkey '^ ' forward-word


# pyenv config
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
#if command -v pyenv 1>/dev/null 2>&1; then
#  eval "$(pyenv init -)"
#fi
#eval "$(pyenv virtualenv-init -)"

# jenv config
eval "$(jenv init -)"

# nvm config
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

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

alias luamake=/Users/ninja/.config/nvim/lua-language-server/3rd/luamake/luamake

[[ -s "/Users/ninja/.gvm/scripts/gvm" ]] && source "/Users/ninja/.gvm/scripts/gvm"

source ~/zsh-helper/helper-functions.sh
