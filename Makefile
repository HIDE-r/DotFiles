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

dotbot_install:
	@echo '=====Dotbot Install Start====='
	git submodule add https://github.com/anishathalye/dotbot .dotbot
	@echo '=====Dotbot Install End====='

git_update_submodule:
	git submodule update --remote

all: neovim

help:
	@echo 'Command:'
	@echo '        dotbot_install				install dotbot '
	@echo '        git_update_submodule			git submodule update --remote'

.PHONY:all dotbot
