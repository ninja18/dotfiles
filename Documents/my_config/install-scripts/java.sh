#!/bin/bash
echo "Checking for jenv..."
jenv -v
if [ $? != 0 ]; then
    brew install jenv
    echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.zshrc
    echo 'eval "$(jenv init -)"' >> ~/.zshrc
    jenv doctor
    jenv enable-plugin export
    exec $SHELL -l
    brew install openjdk11
    echo 'export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"' >> ~/.zshrc
    jenv add /Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home/
    /usr/libexec/java_home -V
    echo "Add these paths using jenv add path"
fi
