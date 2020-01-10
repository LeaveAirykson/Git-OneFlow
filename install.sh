#!/bin/bash
# shellcheck disable=SC2063,SC2129,SC2181,SC2162

# colors
yellow="\033[33m"
green="\033[32m"

# defaults
INSTPATH="/usr/local/bin"
REPONAME="git-nextflow"
REPOURL="https://github.com/LeaveAirykson/git-nextflow"
BRANCH=${2:-"master"}

# handle install
case "$1" in

    uninstall )
        echo "Uninstalling git nextflow commands"
            rm -vf "$INSTPATH/{git-feature,git-hotfix,git-release}"
        ;;

    install )
        # greet
        echo -e "\n⮕ ${yellow}Installing git nextflow commands${normal}"

        # clone repo into tmp folder
        git clone "$REPOURL" --branch "$BRANCH" --single-branch "/tmp/$REPONAME"

        # install commands from repo
        for cmd in "/tmp/$REPONAME/commands/"* ; do
            install -v -m 0644 "$cmd" "$INSTPATH"
        done

        # set git configs
        git config --global nextflow.branch.main "master"
        git config --global nextflow.branch.next "develop"
        git config --global nextflow.prefix.feature "feature/"
        git config --global nextflow.prefix.hotfix "hotfix/"
        git config --global nextflow.prefix.release "release/"
        git config --global nextflow.prefix.version "v"

        # remove tmp repo
        rm -rfv "/tmp/$REPONAME"

        echo "⮕ ${green}Successfully installed git nextflow.${normal}"

        exit
        ;;
esac