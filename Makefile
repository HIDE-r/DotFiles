TOPDIR:=${CURDIR}

export IS_TTY=$(if $(MAKE_TERMOUT),1,0)

# ANSI 转义序列
ifeq ($(IS_TTY),1)
  ifneq ($(strip $(NO_COLOR)),1)
    _Y:=\033[33m
    _R:=\033[31m
    _N:=\033[m
  endif
endif


EMPTY:=
SPACE:= $(EMPTY) $(EMPTY)
GITHUB_REPLACE=hub.fastgit.org
RAW_GITHUB_REPLACE=raw.staticdn.net

# Command
NVIM ?= nvim
MKDIR ?= mkdir
ECHO ?= echo -e

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

neovim_plug_update:
	$(NVIM)  -V1 -es -i NONE -N --noplugin -u ~/.vimrc -c "try | call dein#clear_state() | call dein#update() | finally | qall! | endtry"

neovim: neovim_dein_install

dotbot: prepare

git_init_submodule:
	git submodule update --init --recursive

git_update_submodule:
	git submodule update --remote

fzf: fzf_install

fzf_install: 
	cd ~/DotFiles/.fzf && ./install

# TODO
fzf_upgrade:
	@ echo '=====Upgrading fzf Start====='
	cd ~/DotFiles/.fzf && git pull && ./install
	@ echo '=====Upgrading fzf End====='

create_tmp:
	${MKDIR} ${TMP_DIR}
	${MKDIR} ${STAMP_DIR}

prepare: create_tmp
	@ echo '=====Prepare Completely====='
	touch ${STAMP_DIR}/stamp_prepare_completed

#: Upgrade dotbot submodule
dotbot_upgrade:
	@ $(ECHO) '\n$(_Y)=====Upgrading dotbot Start=====$(_N)\n'
	@ git submodule update --remote dotbot && $(ECHO) 'update dotbot submodule success...'
	@ diff --color -u .dotbot/tools/git-submodule/install dotbot || $(ECHO) '$(_R)Remote branch has changed the script!!!$(_N)'
	@ $(ECHO) '\n$(_Y)=====Upgrading dotbot End=====$(_N)\n'

upgrade: dotbot_upgrade fzf_upgrade

help:
	@ remake --tasks

.PHONY:all dotbot
