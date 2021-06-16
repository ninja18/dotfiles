echo "General tools..."
brew tap homebrew/cask
brew install tmux z fzf ripgrep watch htop tig ffmpeg imagemagick leiningen qxmpp jq nvm helm minikube kafkacat ripgrep fontconfig ghostscript qemu
brew install --HEAD opencv --with-ffmpeg
brew cask install alacritty inkscape
echo "Install Source code pro font from https://fonts.google.com/specimen/Source+Code+Pro"
mkdir ~/.nvm
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo "Load nvm on zsh[Add relevent commands"

