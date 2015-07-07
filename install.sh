#!/bin/bash

NOW=`date +%Y-%m-%d.%H:%M:%S`
BACKUP_DIR="vim-backup.$NOW.$$"


# Backup existing configuration
mkdir ~/$BACKUP_DIR
mv ~/.vimrc ~/.vim ~/$BACKUP_DIR

# Copy new configuration
mkdir ~/.vim
cp -a . ~/.vim/
ln -s ~/.vim/vimrc ~/.vimrc

# Upgrade plugins
pushd ~/.vim/ > /dev/null 2>&1
git submodule init
git submodule update
read -p "Update all plugins (y/n)? "
[ "$REPLY" == "y" ] && git submodule foreach git pull origin master
popd > /dev/null 2>&1

# Install YCM
echo "Installing YCM..."
pushd ~/.vim/bundle/ycm > /dev/null 2>&1
git submodule update --init --recursive
./install.sh
popd > /dev/null 2>&1

echo "Don't forget to install the following Ruby gems for Hammer to work: github-markup tilt redcarpet"
echo "All done!"
exit 0

