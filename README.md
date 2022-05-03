# Nextflow

A simple and uncomplicated git workflow for implementing features, creating hotfixes and releases (tagged commits). This project is an attempted GitFlow alternative.

- [The Nextflow Model](#the-nextflow-model)
- [Install/Uninstall](#installuninstall)
- [Setup](#setup)
- [Default configuration](#default-configuration)
- [Commands](#commands)
  - [Features](#features)
  - [Releases](#releases)
  - [Hotfixes](#hotfixes)
- [References](#references)

## The Nextflow Model

[See the Wiki](https://github.com/LeaveAirykson/git-nextflow/wiki) for a more detailed introduction into the Nextflow Model.

## Install/Uninstall

```bash
# install via curl
curl -sL https://raw.githubusercontent.com/LeaveAirykson/git-nextflow/master/commands/git-nextflow | bash -s install

# to update nextflow run
git nextflow update

# to uninstall globally run the following
git nextflow uninstall

# or manually remove scripts
rm ~/bin/{git-feature,git-hotfix,git-release,git-nextflow}
```

## Setup

```bash
# to setup a project
cd myproject
git init
git nextflow setup
```

## Default configuration

Per default Nextflow will add the following settings to your `~/.gitconfig`:

```bash
[Nextflow "general"]
  strategy = default  # the merge strategy during branch creation

[Nextflow "branch"]
  main = master       # the stable release branch
  next = develop      # the pre-release branch

[Nextflow "prefix"]
  feature = feature/  # prefix for feature branches
  hotfix = hotfix/    # prefix for hotfix branches
  release = release/  # prefix for release branches
  version = v         # prefix for version tag (v1.0.0)
```

### Optional configuration

You can improve the creation of the changelog in `alternate` strategy by setting external urls to your ticket system and repository.

You can do this by running `git nextflow setup` and choose `alternate` strategy. This will activate further option prompts to setup ticket and repository extractions.

These are:

```bash
[Nextflow "general"]
  compareurl = "" # url to diff page. available placeholders: {old} {new}
  commiturl = ""  # url to a commit. available placeholders: {commit}
  ticketurl = ""  # url to ticket system.

[Nextflow "prefix"]
  ticket = ""     # Pattern to match ticket names for extraction
                  # and to be appended to ticketurl
```

### Strategy option

The strategy used by nextflow can either be `default` or `alternate`.

#### `default`

- The release version will be written into a `.version` file.
- Release names must be fully written out. For example: `git release c 1.5.0`.
- Merges are mostly performed with `--squash` setting to keep a slim log history.
- Releases can be published with `git release publish`.
- Changelog will be written from git log and script will ask user to edit it.

#### `alternate`

- Release names can use semver phrases like `major`, `minor`, `patch` during release creation. For example: `git release c patch`.
- Version number will be written into `package.json` file.
- Merges are mostly performed with `--squash` setting to keep a slim log history.
- Releases can not be published for later finishing.The alternate strategy is meant to be used for instant creation and finishing.
- Changelog will be written from git log and supports:
  - extractions of ticket issues.
  - grouped entrys by commit prefixes `[add]`, `[change]`, `[fix]`, `[break]`.
  - link to comparison page to show diff between releases.
  - linked commit hashes in entries.

## Commands

### Features

Features are the smallest component in Nextflow. They represent small to medium work packages that can be grouped (Like modules). Feature branches are prefixed with `feature/` and are **just temporarily (and mostly locally) used**. As soon as a feature is finished, it gets merged into the staging branch. After its implementation the branch gets deleted.

**git feature c <name>**

```bash
# create a feature named sidebar
git feature c sidebar
```

The command starts the following workflow:

1. Branch off from `next` as `feature/sidebar` branch.

**git feature p [name]**

```bash
# publish the feature sidebar to remote
git feature p sidebar
```

**git feature f [name]**

```bash
# finish a feature named sidebar
git feature f sidebar
```

The command starts the following workflow:

1. Squash merge `feature/sidebar` back into `next`.
2. Commit merge with the default message `Implement feature 'sidebar'`.
3. Delete branch `feature/sidebar`.

### Releases

Releases are being created for a very short time because there is no real work done in them. Only the Changelog will be updated and a tag will be set.

There is only one command for creating releases:

**git release c <version>**

```bash
# create a release named 1.10.0
git release c 1.10.0
```

The command starts the following workflow:

1. Branch off from `next` as `release/1.10.0` branch.

**git release p [name]**

```bash
# publish a release to origin.
git release p 1.10.0
```

**git release f [[version]]**

```bash
# finish a release named 1.10.0
git release f 1.10.0
```

The command starts the following workflow:

1. Create entry in `CHANGELOG.md` (user input required).
2. Merge `release/1.10.0` back into `next`.
3. Merge `next` into `main`.
4. Tag commit as the release with release prefix (`v1.10.0`).
5. Delete branch `release/1.10.0`.
6. Pushes new update to the remote.

### Hotfixes

Hotfixes work in the same logic as features but with a different prefix and without squash merging to keep the commit history replicable.

**Recommendation:**
Hotfixes should be postfixed with the version the bug was detected (f.e: `logo-fix@v1.1.0`).

**git hotfix c <name>**

```bash
# create a hotfix named sidebar-logo@v1.10.1
git hotfix c sidebar-logo@v1.10.1
```

The command starts the following workflow:

1. Branch off from `next` as `hotfix/sidebar-logo@v1.10.1` branch

**git hotfix p [name]**

```bash
# publish a release to origin.
git hotfix p sidebar-logo@v1.10.1
```

**git hotfix f (name)**

```bash
# finish a hotfix named sidebar-logo@v1.10.1
git hotfix f sidebar-logo@v1.10.1
```

The command starts the following workflow:

1. Merge `hotfix/sidebar-logo@v1.10.1` back into `next`.
2. Delete branch `hotfix/sidebar-logo@v1.10.1`.

## References

This project would not be possible without the exceptional work of Adam Ruka (OneFlow) and Vincent Driessen (GitFlow)

- [OneFlow](https://www.endoflineblog.com/oneflow-a-git-branching-model-and-workflow)
- [GitFlow](https://nvie.com/posts/a-successful-git-branching-model/)
