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
MAKE ?= make

# Directory Path
TMP_DIR:=${TOPDIR}/tmp
STAMP_DIR:=${TOPDIR}/tmp/stamp

default: help

DAILY_UPDATE_ACTION+=git_update_submodule
DAILY_UPDATE_ACTION+=zinit_update
DAILY_UPDATE_ACTION+=tldr_update
#: Daily update
daily_update: pre_daily_update $(DAILY_UPDATE_ACTION) post_daily_update

###
### git submodule
###
#: Init all submodule from parent repo
git_init_submodule:
	@ $(ECHO) '\n$(_Y)===== [Submodule init] Start =====$(_N)\n'
	git submodule update --init --recursive
	@ $(ECHO) '\n$(_Y)===== [Submodule init] End =====$(_N)\n'

#: Update all submodule from remote
git_update_submodule:
	@ $(ECHO) '\n$(_Y)===== [Submodule update] Start =====$(_N)\n'
	git submodule update --remote
	@ $(ECHO) '\n$(_Y)===== [Submodule update] End =====$(_N)\n'

###
### git-crypt
###
#: Export git-crypt key
git-crypt_export_key:
	git-crypt export-key git-crypt.key

#: Unlock git-crypt encryption
git-crypt_unlock:
	git-crypt unlock git-crypt.key

###
### miscellaneous
###

zinit_update:
	zinit update

tldr_update:
	tldr -u

pkgfile_update:
	sudo pkgfile -u

pre_daily_update:
	@ $(ECHO) '\n$(_Y)===== [Daily update] Start =====$(_N)\n'

post_daily_update:
	@ $(ECHO) '\n$(_Y)===== [Daily update] End =====$(_N)\n'

help:
	@ remake --tasks

.PHONY: daily_update
