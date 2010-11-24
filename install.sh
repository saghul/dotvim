#!/bin/bash

NOW=`date +%Y-%m-%d.%H:%M:%S`
BACKUP_DIR="vim-backup.$NOW.$$"

# Backup existing configuration
mkdir ~/$BACKUP_DIR
mv ~/.vimrc ~/.vim ~/$BACKUP_DIR

# Copy new configuration
mkdir ~/.vim
cp -r * ~/.vim/
ln -s ~/.vim/vimrc ~/.vimrc

# Rebuild Command-T extension
pushd ~/.vim/ruby/command-t
ruby extconf.rb
make
popd

echo "All done!"
exit 0

