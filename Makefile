nvim ?= nvim
RAW_GITHUB_REPLACE=raw.staticdn.net

neovim_dein_install:
	wget https://$(RAW_GITHUB_REPLACE)/Shougo/dein.vim/master/bin/installer.sh
	sh ./installer.sh ~/.vim/dein
	rm ./installer.sh

neovim_plug_install:
	$(nvim)  -V1 -es -i NONE -N --noplugin -c "try | call dein#update() | call dein#recache_runtimepath() | finally | echomsg '' | qall! | endtry"

neovim:neovim_dein_install

dotbot:
	@echo '=====Dotbot Start====='
	git submodule update --init --recursive
	@echo '=====Dotbot End====='

all: neovim

.PHONY:all dotbot
