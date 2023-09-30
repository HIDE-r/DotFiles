include rules.mk

default: help

DAILY_UPDATE_ACTION+=git_update_submodule
DAILY_UPDATE_ACTION+=zinit_update
DAILY_UPDATE_ACTION+=tldr_update
DAILY_UPDATE_ACTION+=rime_sync
DAILY_UPDATE_ACTION+=pacman_update
DAILY_UPDATE_ACTION+=paru_update
DAILY_UPDATE_ACTION+=pkgfile_update
DAILY_UPDATE_ACTION+=neovim_plugin_update
DAILY_UPDATE_ACTION+=tmux_plugin_update

DOTBOT_DIR=.dotbot
DOTBOT_BIN=bin/dotbot
DOTBOT_CONFIG=install.conf.yaml

#: Configuration Install
dotbot:
	@$(CURDIR)/$(DOTBOT_DIR)/$(DOTBOT_BIN) -d $(CURDIR) -c $(DOTBOT_CONFIG)

#: Daily update
daily_update: pre_daily_update bitwarden_get_password $(DAILY_UPDATE_ACTION) post_daily_update

###
### git submodule
###
git_sync_submodule:
	git submodule sync --recursive --quiet

#: Init all submodule from parent repo
git_init_submodule:git_sync_submodule
	@ $(ECHO) '\n$(_Y)===== [Submodule init] Start =====$(_N)\n'
	git submodule update --init --recursive
	@ $(ECHO) '\n$(_Y)===== [Submodule init] End =====$(_N)\n'

#: Update all submodule from remote
git_update_submodule_from_remote:git_sync_submodule
	@ $(ECHO) '\n$(_Y)===== [Submodule update] Start =====$(_N)\n'
	git submodule update --remote --recursive
	@ $(ECHO) '\n$(_Y)===== [Submodule update] End =====$(_N)\n'

#: Update all submodule
git_update_submodule:git_sync_submodule
	@ $(ECHO) '\n$(_Y)===== [Submodule update] Start =====$(_N)\n'
	git submodule update --recursive
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
### bitwarden
###
bitwarden_unlock:
	$(eval export BW_SESSION:=$(shell bw unlock | sed -n '/BW_SESSION=/{p;q}' | cut -d '"' -f2))

bitwarden_get_password: bitwarden_unlock
	$(eval export ROOT_PASSWD:=$(shell bw get password "ArchLinux-R9000K-root"))


###
### ArchLinux Package Manager
###
pkgfile_update: bitwarden_get_password
	@ $(ECHO) '\n$(_Y)===== [Pkgfile update] Start =====$(_N)\n'
	@ expect -c 'spawn sudo pkgfile -u; expect "password*"; send "$(ROOT_PASSWD)\r"; interact'
	@ $(ECHO) '\n$(_Y)===== [Pkgfile update] End =====$(_N)\n'

pacman_update: bitwarden_get_password
	@ $(ECHO) '\n$(_Y)===== [Pacman system update] Start =====$(_N)\n'
	@ expect -c 'spawn sudo pacman -Syu --noconfirm; expect "password*"; send "$(ROOT_PASSWD)\r"; interact'
	@ $(ECHO) '\n$(_Y)===== [Pacman system update] End =====$(_N)\n'

paru_update: bitwarden_get_password
	@ $(ECHO) '\n$(_Y)===== [paru system update] Start =====$(_N)\n'
	@ expect -c 'spawn paru -Syu --noconfirm; expect "password for*"; send "$(ROOT_PASSWD)\r"; interact'
	@ $(ECHO) '\n$(_Y)===== [paru system update] End =====$(_N)\n'

###
### miscellaneous
###

zinit_update:
	@ $(ECHO) '\n$(_Y)===== [Zinit update] Start =====$(_N)\n'
	zsh -ic 'zinit update'
	@ $(ECHO) '\n$(_Y)===== [Zinit update] End =====$(_N)\n'

tldr_update:
	tldr -u

neovim_plugin_update:
	@ $(ECHO) '\n$(_Y)===== [$@] Start =====$(_N)\n'
	nvim -i NONE -V1 --headless -c 'lua require("lazy").sync({wait=true,show=false})' +qa
	@ $(ECHO) '\n$(_Y)===== [$@] End =====$(_N)\n'

tmux_plugin_update:
	@ $(ECHO) '\n$(_Y)===== [$@] Start =====$(_N)\n'
	~/DotFiles/.tpm/bin/update_plugins all
	@ $(ECHO) '\n$(_Y)===== [$@] End =====$(_N)\n'

rime_sync:
	@ $(ECHO) '\n$(_Y)===== [$@] Start =====$(_N)\n'
	~/ScriptTools/Rime/sync_fcitx5.sh
	@ $(ECHO) '\n$(_Y)===== [$@] End =====$(_N)\n'


pre_daily_update:
	@ $(ECHO) '\n$(_Y)===== [Daily update] Start =====$(_N)\n'

post_daily_update:
	@ $(ECHO) '\n$(_Y)===== [Daily update] End =====$(_N)\n'


.PHONY: daily_update
