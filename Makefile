TOPDIR:=${CURDIR}

EMPTY:=
SPACE:= $(EMPTY) $(EMPTY)
GITHUB_REPLACE=hub.fastgit.org
RAW_GITHUB_REPLACE=raw.staticdn.net

# Command
NVIM ?= nvim
MKDIR ?= mkdir

# Directory Path
TMP_DIR:=${TOPDIR}/tmp
STAMP_DIR:=${TOPDIR}/tmp/stamp

all: dotbot fzf neovim

neovim_dein_install:
	wget https://$(RAW_GITHUB_REPLACE)/Shougo/dein.vim/master/bin/installer.sh
	sh ./installer.sh ~/.vim/dein
	rm ./installer.sh

neovim_plug_install:
	$(NVIM)  -V1 -es -i NONE -N --noplugin -c "try | call dein#update() | call dein#recache_runtimepath() | finally | echomsg '' | qall! | endtry"

neovim: neovim_dein_install

dotbot: prepare

git_init_submodule:
	git submodule update --init --recursive

git_update_submodule:
	git submodule update --remote

fzf: fzf_install

fzf_install: 
	cd ~/Dotfiles/.fzf && ./install

fzf_upgrade:
	@echo '=====Upgrading fzf Start====='
	cd ~/Dotfiles/.fzf && git pull && ./install
	@echo '=====Upgrading fzf End====='

create_tmp:
	${MKDIR} ${TMP_DIR}
	${MKDIR} ${STAMP_DIR}

prepare: create_tmp
	@echo '=====Prepare Completely====='
	touch ${STAMP_DIR}/stamp_prepare_completed

help:
	@echo 'Command:'
	@echo '        git_update_submodule			git submodule update --remote'
	@echo '        git_init_submodule			git submodule update --init --recursive'

.PHONY:all dotbot
