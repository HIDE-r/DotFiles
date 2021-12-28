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
	@echo '=====Dotbot End====='

git_init_submodule:
	git submodule update --init --recursive

git_update_submodule:
	git submodule update --remote

all: neovim

help:
	@echo 'Command:'
	@echo '        git_update_submodule			git submodule update --remote'
	@echo '        git_init_submodule			git submodule update --init --recursive'

.PHONY:all dotbot
