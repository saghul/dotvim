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
cp -a . ~/.vim/
ln -s ~/.vim/vimrc ~/.vimrc

# Upgrade plugins
pushd ~/.vim/ > /dev/null 2>&1
git submodule init
git submodule update
read -p "Update all plugins (y/n)? "
[ "$REPLY" == "y" ] && git submodule foreach git pull origin master
popd > /dev/null 2>&1

# Rebuild Command-T extension
if [[ "$RUBY_BIN" != "NULL" ]]; then
    pushd ~/.vim/bundle/command-t/ruby/command-t > /dev/null 2>&1
    $RUBY_BIN extconf.rb > /dev/null 2>&1
    make > /dev/null 2>&1
    popd > /dev/null 2>&1
fi

echo "Don't forget to install the following Ruby gems for Hammer to work: github-markup tilt redcarpet"
echo "All done!"
exit 0

