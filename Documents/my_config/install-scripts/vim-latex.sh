#!/bin/bash
echo "Checking for tex installation..."
latex -v
if [ $? != 0 ]; then
    echo "**** Install mactex from http://tug.org/cgi-bin/mactex-download/MacTeX.pkg ****"
    exit 1
fi

echo "Checking for zathura..."

zathura -v
if [ $? != 0 ]; then
    set -e
    brew install dbus
    echo 'export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"' >> ~/.zshrc
    sed -i "" -e "s;<auth>.*</auth>;<auth>DBUS_COOKIE_SHA1</auth>;g" /opt/homebrew/opt/dbus/share/dbus-1/session.conf
    brew services start dbus
    brew tap zegervdv/zathura
    brew install girara --HEAD
    brew install zathura --with-synctex
    brew install zathura-pdf-poppler
    mkdir -p $(brew --prefix zathura)/lib/zathura
    ln -s $(brew --prefix zathura-pdf-poppler)/libpdf-poppler.dylib $(brew --prefix zathura)/lib/zathura/libpdf-poppler.dylib
    if [ ! -d "$XDG_CONFIG_HOME/zathura/" ]; then
        mkdir -p "$XDG_CONFIG_HOME/zathura"
    fi
    echo "set selection-clipboard clipboard" >> "$XDG_CONFIG_HOME/zathura/zathurarc"

fi

set +e
echo "Checking for choose finder installation..."
choose -v
if [ $? != 0 ]; then
    brew install choose-gui
fi
echo ">>> reboot the machine to make it work"
