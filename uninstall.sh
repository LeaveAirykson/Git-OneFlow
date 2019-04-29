#!/bin/bash

# ==================================
# COLORS
# ==================================
# terminal formats
bold="\033[1m"
green="\033[32m"
normal="\033[0m"

SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}")
SCRIPTPATH=$(realpath "${SCRIPTPATH}")
BINPATH=/usr/local/bin

echo -e "\n${bold}Oneflow git extension uninstaller${normal}"
echo "==============================="


uninstall() {
    for command in commands/*; do
        rm "$BINPATH/$(basename "$command")"
    done
}

if uninstall ; then
    echo -e "${green}Uninstalled oneflow commands from ($BINPATH).${normal}"
fi