# WebFlow

A simple and uncomplicated git workflow for implementing features, creating hotfixes and releases (tagged commits). This project is an attempted GitFlow alternative.

* [The WebFlow model](#the-webflow-model)
    * [The main branches](#the-main-branches)
    * [The supporting branches](#the-supporting-branches)
    * [Versioning releases](#versioning-releases)
* [Install/Uninstall](#installuninstall)
* [Default configuration](#default-configuration)
* [Commands](#commands)
    * [Features](#features)
    * [Releases](#releases)
    * [Hotfixes](#hotfixes)
* [Why WebFlow?](#why-webflow)
* [References](#references)

## The WebFlow model

WebFlow works similar to other known git workflows like GitFlow or OneFlow. It is based on the following principles:

1. There are two main branches (`main` and `next`).
2. There are 3 different types of supporting branches (`features`, `hotfixes`, `releases`).

### The main branches
- The main branches have an **infinite lifetime**.
- Per default the names are `master` and `develop`. You can change that inside your [configuration](#default-configuration).

| `main` | `next` |
|---|---|
|The branch which **always reflects a production-ready state**.|The branch which **always reflects a state with the latest staging changes for the next release**.|

### The supporting branches

- Each of these branches have a specific purpose and differ only in their way they are being merged and the time when they are created.
- Unlike the main branches, these branches always have **a limited lifetime**, since they will be removed eventually.
- They all branch off and merge back from `develop`.
- You can change the prefixes inside your [configuration](#default-configuration)

|Prefixes|`feature/*`|`release/*`|`hotfix/*`|
|---|---|---|---|
|**Purpose**|Used for creating new features and additions|Used only as a temporary branch while creating a release. has the shortest livetime.|Works the same way like a feature but will be |
|**Lifetime**|As long as needed to finish the feature.|only temporarily to create a changelog.|as long as needed to finish the hotfix.|
|**Merge type**|squash merge|normal merge|normal merge|

#### Versioning releases
We use semantic versioning for the releases. The version number is prefixed with a `v` and has the format `vMAJOR.MINOR.PATCH` (for example: v1.5.10).

**Rules for Incrementation:**

- Increment `MAJOR` version when you make incompatible API changes.
- Increment `MINOR` version when you add functionality in a backwards-compatible manner.
- Increment `PATCH` version when you make backwards-compatible hotfixes.



## Install/Uninstall
To install the extension download the latest release here: [Git-WebFlow Latest Release](https://github.com/LeaveAirykson/Git-WebFlow/archive/master.zip).
After downloading the zip file unpack it and execute the install script inside.

```bash
# install the extension
./install.sh

# to uninstall just remove the script files
rm /usr/local/bin/{git-feature,git-hotfix,git-release}
```

## Commands

### Features
Features are the smallest component in WebFlow. They represent small to medium work packages that can be grouped (Like modules). Feature branches are prefixed with `feature/` and are **just temporarily (and mostly locally) used**. As soon as a feature is finished, it gets **squash merged** into the staging branch to keep the history slim. After its implementation the branch gets deleted.

**git feature** `c|f (name)`

```bash
# create a feature named sidebar
git feature c sidebar
```

The command starts the following workflow:

1. Branch off from `next` as `feature/sidebar` branch

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

**git release** `c (version)`

```bash
# create a release named 1.10.0
git release c 1.10.0
```

The command starts the following workflow:

1. Branch off from `next` as `release/1.10.0` branch.
2. Update `CHANGELOG.md` (user input required).
3. Merge back into `next`.
4. Merge `next` into `main`.
5. Tag commit as the release with release prefix (`v1.10.0`).
5. Delete branch `release/1.10.0`.

### Hotfixes

Hotfixes work in the same logic as features but with a different prefix and without squash merging to keep the commit history replicable.

**Recommendation:**
Hotfixes should be postfixed with the version the bug was detected (f.e: `logo-fix@v1.1.0`).

**git hotfix** `c|f (name)`

```bash
# create a hotfix named sidebar-logo@v1.10.1
git hotfix c sidebar-logo@v1.10.1

# finish a hotfix named sidebar-logo@v1.10.1
git hotfix f sidebar-logo@v1.10.1
```

## Default configuration

Per default WebFlow will add the following settings to your `~/.gitconfig`:

```bash
[webflow "branch"]
    main = master       # the stable release branch
    next = develop      # the pre-release branch

[webflow "prefix"]
    feature = feature/  # prefix for feature branches
    hotfix = hotfix/    # prefix for hotfix branches
    release = release/  # prefix for release branches
    version = v         # prefix for version tag (v1.0.0)
```

## Why WebFlow?

After some years of using GitFlow as a web developer I had to admit, while it showed me the right way to use a consistent workflow of creating features/hotfixes and releases, that it bloated my git history to an unreadable mess. The release cycles for the small webprojects i worked on needed to be flexible and sometimes just implemented 2 to 3 small commits, without changing much. Due to the way GitFlow works I would spend a lot of time creating and merging branches into the final release and development branches. Use different prefixes for hotfixes, releases, patches, features, etc. It felt a little bit overcomplicated for these small things i worked on, so I was never fully satisfied.

At one point I stumbled upon [OneFlow](https://www.endoflineblog.com/oneflow-a-git-branching-model-and-workflow). A great workflow that tries to avoid these redundant tasks. I used it for some weeks and I appreciated the simplicity over GitFlow. The right thing for small web projects. I adapted the logic, extended it to my needs and created WebFlow.

## References
- [OneFlow](https://www.endoflineblog.com/oneflow-a-git-branching-model-and-workflow)
- [GitFlow](https://nvie.com/posts/a-successful-git-branching-model/)