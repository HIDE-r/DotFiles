#!/bin/sh


check_and_run() {
  if ! pgrep -f "$1" ;
  then
    echo "run $@"
    "$@"& > /dev/null
  fi
}

run() {
  "$@"& > /dev/null
}

check () {
  pgrep "$1" > /dev/null 2>&1
}


# IME (input method)
check_and_run fcitx5

# optimus-manager optimus-manager
# https://github.com/Askannz/optimus-manager/wiki/FAQ,-common-issues,-troubleshooting

if ! check optimus-manager-qt; then
	run prime-offload
	run optimus-manager-qt
fi

check_and_run /usr/lib/polkit-kde-authentication-agent-1
check_and_run copyq
