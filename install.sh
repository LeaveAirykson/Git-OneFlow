#!/bin/bash
# shellcheck disable=SC2063,SC2129,SC2181,SC2162

# ==================================
# COLORS
# ==================================
# terminal formats
bold="\033[1m"
red="\033[31m"
green="\033[32m"
yellow="\033[33m"
normal="\033[0m"

SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}")
SCRIPTPATH=$(realpath "${SCRIPTPATH}")
BINPATH="$HOME/bin"
installed=0

echo -e "\n${yellow}${bold}Git WebFlow installer"
echo -e "======================${normal}"

# give some information whats going to happen
echo -e "This installer will place the scripts ${yellow}git-feature${normal},"
echo -e "${yellow}git-hotfix${normal} and ${yellow}git-release${normal} in the folder ${yellow}$BINPATH.${normal}\n"

# make sure to create ~/bin if non existent
if [ ! -d "$BINPATH" ]; then
    echo -e "${red}$BINPATH doesn't exist.${normal}\n"
    read -p "Should it be created now? (Y/n) " askCreateBin

    if [ "$askCreateBin" == 'Y' ]; then
        mkdir ~/bin
    fi
fi

# make sure user wants to continue
read -p "Do you want to continue? (Y/n) " askContinue

echo ""

# abort if wished
if [ ! "$askContinue" == 'Y' ]; then
    exit 1
fi

copyFiles() {
    echo -e "Moving files into ${yellow}$BINPATH${normal} folder."
    cp -v "$SCRIPTPATH"/commands/* "$BINPATH/"
    installed=1
}

setGitConfig() {
    git config --global webflow.branch.main "master"
    git config --global webflow.branch.next "develop"
    git config --global webflow.prefix.feature "feature/"
    git config --global webflow.prefix.hotfix "hotfix/"
    git config --global webflow.prefix.release "release/"
    git config --global webflow.prefix.version "v"
    installed=2
}

removeFolder() {
    echo -e "\n${green}Installation finished!${normal}"
    read -p "This folder can be deleted. Proceed with deletion? (Y/n) " askRemoveFolder

    if [ "$askRemoveFolder" == 'Y' ]; then
        cd ..
        rm -rf "$SCRIPTPATH"
        exit 1
    fi
}

if copyFiles ; then
    echo -e "\n=> ${green}Installed webflow commands ($BINPATH).${normal}"
fi

if setGitConfig ; then
    echo -e "=> ${green}Added webflow configs (~/.gitconfig).${normal}\n"
fi

if [ $installed == "2" ]; then
    removeFolder
fi