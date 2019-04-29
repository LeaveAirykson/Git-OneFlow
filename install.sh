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

echo -e "\n${bold}Oneflow git extension installer${normal}"
echo "==============================="


symlinkCommands() {
    echo "Symlinking commands:"
    for command in commands/*; do
        ln -sfv "$SCRIPTPATH/$command" "$BINPATH"
    done
    echo ""
}

setGitConfig() {
    git config --global oneflow.branch.main "master"
    git config --global oneflow.branch.next "develop"
    git config --global oneflow.prefix.feature "feature/"
    git config --global oneflow.prefix.hotfix "hotfix/"
    git config --global oneflow.prefix.release "release/"
}

if symlinkCommands ; then
    echo -e "=> ${green}Symlinked oneflow commands ($BINPATH).${normal}"
fi

if setGitConfig ; then
    echo -e "=> ${green}Added oneflow configs (~/.gitconfig).${normal}"
fi