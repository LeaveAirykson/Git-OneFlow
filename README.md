# WebFlow

A simple and uncomplicated git workflow for implementing features, creating hotfixes and releases (tagged commits). This project is an attempted GitFlow alternative.

## Who needs this?

WebFlow is thought as a solution for people creating small to medium web applications and pages with a very small team. The scripts and logic are loosely based on OneFlow - the branching model described in [this blog article over at End of Line](https://www.endoflineblog.com/oneflow-a-git-branching-model-and-workflow).

## Install/Uninstall
To install the extension please clone the repository and start the install script. There is a seperate uninstall.sh file for uninstalling/removing everything.

```bash
# clone repo
git clone git@github.com:LeaveAirykson/Git-WebFlow.git

# install script
. install.sh

# uninstall script
. uninstall.sh
```

## Commands
WebFlow assumes the usage of two main branches. One for production and one for a staging/development environment. Per default the names are `master` and `develop`.

### Features
Features are the smallest component in WebFlow. They represent small to medium work packages that can be grouped (Like modules).

**git feature** `s|f (name)`

```bash
# start a feature named sidebar
git feature s sidebar

# finish a feature named sidebar
git feature f sidebar
```

Feature branches are prefixed with `feature/` and are **just temporarily (and mostly locally) used**. As soon as a feature is finished, it gets **squash merged** into the staging branch to keep the history slim. After its implementation the branch gets deleted.


### Releases
There is only one command for creating releases:

**git release** `c (version)`

```bash
# create a release named 1.10.0
git release c 1.10.0
```

The command starts the following workflow:

1. Branch off from develop as `release/1.10.0` branch
2. Update `CHANGELOG.md` (user input required)
3. Merge back into `develop`
4. Merge `develop` into `master`
5. Tag commit as the release with release prefix (`v1.10.0`)
5. Delete `release/1.10.0` branch

### Hotfixes

Hotfixes work in the same logic as features but with a different prefix and without squash merging to keep the commit history replicable.

**Recommendation:**
Hotfixes should be postfixed with the version the bug was detected (f.e: `logo-fix@v1.1.0`).

**git hotfix** `s|f (name)`

```bash
# start a hotfix named sidebar-logo@v1.10.1
git hotfix s sidebar-logo@v1.10.1

# finish a hotfix named sidebar-logo@v1.10.1
git hotfix f sidebar-logo@v1.10.1
```

## Default configuration

Per default WebFlow will add the following settings to your gitconfig:

```bash
[webflow "branch"]
    main = master
    next = develop

[webflow "prefix"]
    feature = feature/
    hotfix = hotfix/
    release = release/
    version = v
```

## Why WebFlow?

After some years of using GitFlow as a web developer I had to admit, while it showed me the right way to use a consistent workflow of creating features/hotfixes and releases, that GitFlow bloated my log history to an unreadable mess. The release cycles for the small webprojects i worked on needed to be flexible and sometimes just implemented 2 to 3 small commits, without changing much. Due to the way GitFlow works I would spend a lot of time creating and merging branches into the final release and development branches. Use different prefixes for hotfixes, releases, patches, features, etc. It felt a little bit overcomplicated for these small things i worked on, so I was never fully satisfied.

At one point I stumbled over [OneFlow](https://www.endoflineblog.com/oneflow-a-git-branching-model-and-workflow). A great workflow that tries to avoid these redundant tasks. I used it for some weeks and I appreciated the simplicity over GitFlow. The right thing for small web projects. I adapted the logic, extended it to my needs and created WebFlow.

## References
- [OneFlow](https://www.endoflineblog.com/oneflow-a-git-branching-model-and-workflow)
- [GitFlow](https://nvie.com/posts/a-successful-git-branching-model/)