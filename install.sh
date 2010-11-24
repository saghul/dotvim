#!/bin/bash

NOW=`date +%Y-%m-%d.%H:%M:%S`
BACKUP_DIR="vim-backup.$NOW.$$"


# Find Ruby binary
RUBY_BIN="NULL"
for BIN in "ruby" "ruby1.8" "ruby1.9"
do
    which $BIN > /dev/null 2>&1
    if [[ $? -eq 0 ]]; then
	RUBY_BIN=$BIN
	break
    fi
done

# Backup existing configuration
mkdir ~/$BACKUP_DIR
mv ~/.vimrc ~/.vim ~/$BACKUP_DIR

# Copy new configuration
mkdir ~/.vim
cp -r * ~/.vim/
ln -s ~/.vim/vimrc ~/.vimrc

# Rebuild Command-T extension
if [[ "$RUBY_BIN" != "NULL" ]]; then
    pushd ~/.vim/bundle/Command-T/ruby/command-t
    ruby extconf.rb
    make
    popd
fi

echo "All done!"
exit 0

