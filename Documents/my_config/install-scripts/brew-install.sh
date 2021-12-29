echo "General tools..."
brew tap homebrew/cask
brew install tmux z fzf ripgrep watch htop tig ffmpeg imagemagick leiningen qxmpp jq nvm helm minikube kafkacat ripgrep fontconfig ghostscript qemu curl
brew install --HEAD opencv --with-ffmpeg
brew cask install alacritty inkscape
brew install wireshark --with-qt
brew install --build-from-source mhanberg/zk/zk
brew tap homebrew/cask-fonts && brew install --cask font-sauce-code-pro-nerd-font
echo "Install Source code pro font from https://fonts.google.com/specimen/Source+Code+Pro"
mkdir ~/.nvm
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo "Load nvm on zsh[Add relevent commands"

