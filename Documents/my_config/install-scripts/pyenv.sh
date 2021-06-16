#!/bin/bash
echo "Checking for pyenv..."
pyenv -v
if [ $? != 0 ]; then
   brew install pyenv
   echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
   pyenv install 3.7.7
   pyenv global 3.7.7
   pyenv version
   echo "Installing pyenv virtualenv..."
   git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
   echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
fi

pip install pynvim inkscape-figures
pip install 'python-language-server[all]' --use-feature=2020-resolver
