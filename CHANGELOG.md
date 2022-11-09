# [4.7.2](https://github.com/LeaveAirykson/git-nextflow/compare/v4.7.1...v4.7.2) - 2022-11-09

### Fixed

- Fix changelog write from alternate mode not using indendation correctly ([bf07bff](https://github.com/LeaveAirykson/git-nextflow/commit/bf07bff07a407684a6c67e73fe6eaa37f5969d65)) 

# [4.7.1](https://github.com/LeaveAirykson/git-nextflow/compare/v4.7.0...v4.7.1) - 2022-10-24

### Fixed

- Fixed git release f trying to push all branches ([e1e6bf9](https://github.com/LeaveAirykson/git-nextflow/commit/e1e6bf9383729075b1be749bee2fc9e5c7b5cc51)) 

# [4.7.0](https://github.com/LeaveAirykson/git-nextflow/compare/v4.6.0...v4.7.0) - 2022-05-03

### Fixed

- Fix writing gitconfigs and add 'nextflow config' command ([a9cec14](https://github.com/LeaveAirykson/git-nextflow/commit/a9cec1411497cdf6b10aab622bbd7a1fa2a12612)) 
- Remove tmp install dir before cloning new one ([027eeda](https://github.com/LeaveAirykson/git-nextflow/commit/027eeda85f902962807cce2b025c36be8c3ae23f)) 

### Changed

- Improve instructions readme ([097d9e7](https://github.com/LeaveAirykson/git-nextflow/commit/097d9e7d3bf8b986e1ae2237d6a68bb43a18436c)) 
- Remove obsolete .version file ([c2392b9](https://github.com/LeaveAirykson/git-nextflow/commit/c2392b98afb69a66d69860fb8453f84b71cc4a71)) 
- Update instructions in readme file ([c645d4a](https://github.com/LeaveAirykson/git-nextflow/commit/c645d4a1f689b268d49658491e55a8833070df56)) 
- Add update command alias for install routine ([5c29956](https://github.com/LeaveAirykson/git-nextflow/commit/5c29956940e9a3c98cb8f11b5125f796cfce70dc)) 
- Seperate setup command from install routine ([a423d82](https://github.com/LeaveAirykson/git-nextflow/commit/a423d828a0a50fcb82e49e3e8a9fcda0af6826b0)) 
- Implement better setup file and improved changelog creation ([e778634](https://github.com/LeaveAirykson/git-nextflow/commit/e77863477cf2d160de32094ab6a45ee041385b21)) 
- Refactor git-release to support ticket extraction ([8b3f4ff](https://github.com/LeaveAirykson/git-nextflow/commit/8b3f4ffb7a9d66a43a658ec0525a8e6585eca4dd)) 

# 4.6.0 - 2022-02-02

### Fixed

- Fix replacement of commit prefixes in changelog missing whitespaces (7eae804)

### Changed

- Add commit prefixes to feature and hotfix (0a41840)

# 4.5.0 - 2022-02-02

### Changed

- Refactor alternate strategy to use squash merges instead of --no-ff (913f6f0)

### Misc

- Add package.json (4a510bb)

## v4.4.0

- Write changelog based on commit prefix in alternate strategy

## v4.3.0

- Change format for git log in changelog creation (alternate)

## v4.2.1

- Fix alternate release strategy empty versiontag when hooks are used for npm version

## v4.2.0

- Refactor git-release to improve verbosity and add use only commit subject for changelog.

## v4.1.0

- Add alternate strategy.

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
