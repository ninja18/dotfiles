# Export variables

export PATH=/usr/local/texlive/2020/bin/x86_64-darwin:$PATH
export PATH=/Users/ninja/Documents/Others/sage/other_comps:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
export XDG_CONFIG_HOME=~/.config
export VISUAL=nvim
export EDITOR=nvim
#export JAVA_HOME=$(/usr/libexec/java_home -v 12)
export ZSH="/Users/ninja/.oh-my-zsh"
export MY_CONFIG="$HOME/Documents/my_config"
ZSH_THEME="typewritten"

# Plugins

plugins=(git)
plugins=(git z)
plugins=(zsh-autosuggestions)


# Source plugin files

source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. /usr/local/etc/profile.d/z.sh

# Aliases

alias config='/usr/local/bin/git --git-dir=$MY_CONFIG/dotfiles --work-tree=$HOME'

# Custom key bindings

bindkey '^ ' forward-word


# pyenv config
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"

# jenv config
eval "$(jenv init -)"

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