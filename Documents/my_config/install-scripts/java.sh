#!/bin/bash -el
echo "Checking for jenv..."
jenv -v
if [ $? != 0 ]; then
    brew install jenv
    echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.zshrc
    echo 'eval "$(jenv init -)"' >> ~/.zshrc
    jenv doctor
    jenv enable-plugin export
    exec $SHELL -l
    /usr/libexec/java_home -V
    echo "Add these paths using jenv add path"

