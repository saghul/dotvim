#!/bin/bash

NOW=`date +%Y-%m-%d.%H:%M:%S`
BACKUP_DIR="vim-backup.$NOW.$$"
CURRENT_DIR=`pwd`


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

# Upgrade plugins
rm -rf ~/.vim/bundle
mkdir ~/.vim/bundle
pushd ~/.vim/bundle > /dev/null 2>&1
$CURRENT_DIR/update_plugins.py
popd > /dev/null 2>&1

# Rebuild Command-T extension
if [[ "$RUBY_BIN" != "NULL" ]]; then
    pushd ~/.vim/bundle/command-t/ruby/command-t > /dev/null 2>&1
    $RUBY_BIN extconf.rb
    make
    popd > /dev/null 2>&1
fi

echo "All done!"
exit 0

