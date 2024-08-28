# Unexported variables from previous machine [all these paths look outdated]
#
# export PATH=/usr/local/texlive/2020/bin/x86_64-darwin:$PATH
# export PATH=/Users/ninja/Documents/Others/sage/other_comps:$PATH
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export PATH="$HOME/go/bin:$PATH"
# export PATH="/usr/local/opt/curl/bin:$PATH"
# export PATH="/usr/local/opt/llvm/bin:$PATH"
# export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
# export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# export GOROOT="/usr/local/go"
# export GOPATH="$HOME/go"
# export ANDROID_HOME=/Users/ninja/Library/Android/sdk
# export ANDROID_SDK_ROOT=/Users/ninja/Library/Android/sdk
# export ANDROID_AVD_HOME=/Users/ninja/.android/avd
# export JAVA_HOME=$(/usr/libexec/java_home -v 12)

# Export variables
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$GOROOT/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/vcpkg:$PATH"
#export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export VISUAL=nvim
export EDITOR=nvim
export ZSH="$HOME/.oh-my-zsh"
export NVM_DIR="$HOME/.nvm"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export TALISMAN_HOME="$HOME/.talisman/bin"
export PATH="$TALISMAN_HOME:$PATH"
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
export ZK_NOTEBOOK_DIR="$HOME/Documents/notes"
ZSH_THEME=""
export TYPEWRITTEN_RELATIVE_PATH="adaptive"
export TYPEWRITTEN_PROMPT_LAYOUT="singleline"
export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET" # required for zathura
#export LDFLAGS="-L/opt/homebrew/opt/llvm/lib -L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++"
#export CXXFLAGS="-I/opt/homebrew/opt/llvm/include -Wall -Werror -pedantic-errors"
#export CC=/opt/homebrew/opt/llvm/bin/clang
#export CXX=/opt/homebrew/opt/llvm/bin/clang++

# To use the bundled libc++ please add the following LDFLAGS:
#  LDFLAGS="-L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++"

# Functions
_fzf_compgen_path() {
    # overriding the fzf default find command to use ripgrep 
    rg --files --hidden --glob '!.git' --glob '!Library' --glob '!Music'
}

# Source plugin files
source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /opt/homebrew/etc/profile.d/z.sh
source ~/zsh-helper/helper-functions.sh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
alias lsf='function _lsf(){ (cd $(dirname "$1") && echo $(pwd)/$(basename "$1")) };_lsf' # get absolute path
alias config='/usr/bin/git --git-dir=$HOME/Documents/system-config/dotfiles --work-tree=$HOME'
alias work-firefox='nohup /Applications/Firefox.app/Contents/MacOS/firefox -P "Work" -no-remote > /dev/null 2>&1 &'
alias finance-firefox='nohup /Applications/Firefox.app/Contents/MacOS/firefox -P "Finance" -no-remote > /dev/null 2>&1 &'
alias vlime='rlwrap sbcl --load ~/.local/share/nvim/plugged/vlime/lisp/start-vlime.lisp'
alias sbcl-repl='rlwrap sbcl --eval "(ql:quickload :swank)"  --eval "(swank:create-server :dont-close t)"'

# Custom key bindings
bindkey '^ ' forward-word


# pyenv config
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
#if command -v pyenv 1>/dev/null 2>&1; then
#  eval "$(pyenv init -)"
#fi
#eval "$(pyenv virtualenv-init -)"
function nvimvenv {
  if [[ -e "$VIRTUAL_ENV" && -f "$VIRTUAL_ENV/bin/activate" ]]; then
    source "$VIRTUAL_ENV/bin/activate"
    command nvim $@
    deactivate
  else
    command nvim $@
  fi
}

alias vim=nvim
alias pvim='pipenv run nvim'

# jenv config
eval "$(jenv init -)"

# nvm config
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

[[ -s "/Users/ninja/.gvm/scripts/gvm" ]] && source "/Users/ninja/.gvm/scripts/gvm"

# Set typewritten ZSH as a prompt
fpath=($fpath "/Users/niranjan/.zfunctions")
autoload -U promptinit; promptinit
prompt typewritten


# Load Angular CLI autocompletion.
source <(ng completion script)
