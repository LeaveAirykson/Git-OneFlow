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

echo -e "\n${bold}WebFlow git extension installer${normal}"
echo "==============================="


symlinkCommands() {
    echo "Symlinking commands:"
    for command in commands/*; do
        ln -sfv "$SCRIPTPATH/$command" "$BINPATH"
    done
    echo ""
}

setGitConfig() {
    git config --global webflow.branch.main "master"
    git config --global webflow.branch.next "develop"
    git config --global webflow.prefix.feature "feature/"
    git config --global webflow.prefix.hotfix "hotfix/"
    git config --global webflow.prefix.release "release/"
    git config --global webflow.prefix.version "v"
}

if symlinkCommands ; then
    echo -e "=> ${green}Symlinked webflow commands ($BINPATH).${normal}"
fi

if setGitConfig ; then
    echo -e "=> ${green}Added webflow configs (~/.gitconfig).${normal}"
fi