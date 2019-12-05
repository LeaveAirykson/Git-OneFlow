#!/bin/bash
# shellcheck disable=SC2063,SC2129,SC2181,SC2162

# ==================================
# COLORS
# ==================================
# terminal formats
bold="\033[1m"
red="\033[31m"
green="\033[32m"
cyan="\033[36m"
yellow="\033[33m"
normal="\033[0m"

SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}")
SCRIPTPATH=$(realpath "${SCRIPTPATH}")
installed=0

echo -e "\n${cyan}Set the install folder.${normal}"
echo -e "And make sure its added to your \$PATH."

read -e -p "(/usr/local/bin) " setInstallPath

# define the install folder
INSTPATH=${setInstallPath:-"/usr/local/bin"}

# give some information whats going to happen
echo -e "\n${cyan}The following scripts will be placed in ${INSTPATH}${normal}:"

# list commands
ls "$SCRIPTPATH"/commands|tr " " "\n"

# make sure to create ~/bin if non existent
if [ ! -d "$INSTPATH" ]; then
    echo -e "\n${red}$INSTPATH doesn't exist. It will be created for you.${normal}"
fi

echo ""

# make sure user wants to continue
read -p "Do you want to continue? (Y/n) " askContinue

# abort if wished
if [ ! "$askContinue" == 'Y' ]; then
    exit 1
fi

copyFiles() {
    cp "$SCRIPTPATH"/commands/* "$INSTPATH/"
    installed=1
    echo ""
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
    echo -e "⮕ ${green}Installation finished!${normal}\n"
    read -p "This folder can be deleted. Proceed with deletion? (Y/n) " askRemoveFolder

    if [ "$askRemoveFolder" == 'Y' ]; then
        rm -rf "$SCRIPTPATH"
        cd ~
        exit 1
    fi
}

if copyFiles ; then
    echo -e "⮕ ${green}Installed webflow commands ($INSTPATH).${normal}"
fi

if setGitConfig ; then
    echo -e "⮕ ${green}Added webflow configs (~/.gitconfig).${normal}"
fi

if [ $installed == "2" ]; then
    removeFolder
fi