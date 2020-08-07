## v4.0.1
- Update Readme

## v4.0.0
- Implement publish and finish option for all commands.

## v3.3.0
- Implement commit bodytext during feature finish

## v3.2.0
- Change default install folder to ~/bin so we don't need sudo

## v3.1.3
- Fix install script not creating executables
- Fix install instructions

## v3.1.2
- Cleanup README

## v3.1.1
- Fix wiki link in README.md

## v3.1.0
- Use versiontag as commit message reference instead of versionnumber

## v3.0.0
- Rename project to nextflow and introduce new install routine
- Improve success messages in console

## v2.0.0
- Implement git release publish and renamed git release create

## v1.5.0
- Hide output of checking if there is a remote
- Move check for second parameter to the end

## v1.4.1
- Fix output help usage
- Refactor git-release to executes all checks before doing the rest


## v1.4.0
- Improve createRealase() by using release notes as tag messages
- Implement pushing all branches after release creation

## v1.3.4
- Hide verbosity of git chekout on deviation check
- Improve check for changes on remote branch
- Implement remote update on every call of git-release
- Improve checks for existing version tag and remote pull
- Remove redundant remote fetching during check
- Fix issue where check is not finding usage()
- Implement check for remote HEAD deviation

## v1.3.3
- Change most recent version output to show always
- Improve verbosity of current release
- Fix check for existing version tag

## v1.3.2
- Check for existing version tag before creating release
- Check out 'next' branch after creation of release

## v1.3.1
- Fix install script not finding ~/bin

## v1.3.0
- Add .version file creation

## v1.2.4
- Implement installer to create ~/bin if nonexistent
- Fix typo in README.md

## v1.2.3
- Fix commands always using master as BRANCHFROM
- Update README.md with bin path

## v1.2.2
- Implement fallbacks for BRANCHFROM on all commands
- Implement fallback if 'next' release does not exist
- Change wording of removeFolder()
- Fix install script for windows users
- Move out of the folder before deleting it

## v1.2.1
- Fix install script not using sudo to copy commands
- Updated README.md
- Add WebFlow model explanation to README.md

