echo "General tools..."
brew tap homebrew/cask
brew install tmux z fzf ripgrep watch htop tig ffmpeg imagemagick leiningen qxmpp jq nvm helm minikube kafkacat ripgrep fontconfig ghostscript qemu bat mercurial mosquitto toilet tree wget zsh-autosuggestions
brew install --HEAD tree-sitter
brew install --HEAD luajit
brew install --HEAD neovim
brew install clojure/tools/clojure
brew install clojure-lsp/brew/clojure-lsp-native
brew install --HEAD opencv --with-ffmpeg
brew install --cask alacritty inkscape anydo wireshark spotify android-file-transfer zoom
brew install --build-from-source mhanberg/zk/zk
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
echo "Install required version of go using gvm"
brew tap homebrew/cask-fonts && brew install --cask font-sauce-code-pro-nerd-font
echo "Install Source code pro font from https://fonts.google.com/specimen/Source+Code+Pro"
mkdir ~/.nvm
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo "Load nvm on zsh[Add relevent commands"


## install clojure and clojure lsp - done, colima,docker, docker-compose - later, firefoxpwa - later, coreutils, go, go version manager - done, mosquitto - done, neovim - done, openssl@3(if required), texinfo, toilet - done, tree - done, tree-sitter - done, vagrant, vagrant-manager,virtualbox - not needed now, wget - done, xquartz

## Check vim setup for latex, clojure, python and other languages
