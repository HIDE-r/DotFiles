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

all: help

#: init all submodule from parent repo
git_init_submodule:
	git submodule update --init --recursive

#: update all submodule from remote
git_update_submodule:
	@ $(ECHO) '\n$(_Y)=====Update all submodule from remote Start=====$(_N)\n'
	git submodule update --remote
	@ $(ECHO) '\n$(_Y)=====Update all submodule from remote End=====$(_N)\n'

create_tmp:
	${MKDIR} ${TMP_DIR}
	${MKDIR} ${STAMP_DIR}

prepare: create_tmp
	@ echo '=====Prepare Completely====='
	touch ${STAMP_DIR}/stamp_prepare_completed

help:
	@ remake --tasks

.PHONY:all dotbot
