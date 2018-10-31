
install: backup copy-new install-ycm

backup:
	$(eval NOW := $(shell date +%Y-%m-%d.%H:%M:%S))
	$(eval BACKUP_DIR := $(shell echo "vim-backup.$(NOW).$$$$"))
	mkdir ~/$(BACKUP_DIR)
	mv -f ~/.vimrc ~/.vim ~/$(BACKUP_DIR) 2> /dev/null || true

copy-new:
	mkdir -p ~/.vim && \
	cp -a . ~/.vim && \
	ln -s ~/.vim/vimrc ~/.vimrc

install-ycm:
	echo "Installing YCM..."
	pushd ~/.vim/bundle/ycm && \
	git submodule update --init --recursive && \
	./install.py

upgrade:
	pushd ~/.vim && \
	git submodule init && \
	git submodule update && \
	git submodule foreach git pull origin master

