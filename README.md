# WebFlow

A simple and uncomplicated git workflow for implementing features, creating hotfixes and releases (tagged commits). This project is an attempted GitFlow alternative.

## Install/Uninstall
To install the extension please clone the repository and start the install script. There is a seperate uninstall.sh file for uninstalling/removing everything.

```
# clone repo
git clone git@github.com:LeaveAirykson/git-oneflow.git

# install script
. install.sh

# uninstall script
. uninstall.sh
```

## Who needs this?

WebFlow is thought as a solution for people creating small to medium web applications and pages with a very small team. The scripts and logic are loosely based on OneFlow - the branching model described in [this blog article over at End of Line](https://www.endoflineblog.com/oneflow-a-git-branching-model-and-workflow).

## Why WebFlow?

After some years of using GitFlow as a web developer I had to admit, while it showed me the right way to use a consistent workflow of creating features/hotfixes and releases, that GitFlow bloated my log history to an unreadable mess. The release cycles for the small webprojects i worked on needed to be flexible and sometimes just implemented 2 to 3 small commits, without changing much. Due to the way GitFlow works I would spend a lot of time creating and merging branches into the final release and development branches. Use different prefixes for hotfixes, releases, patches, features, etc. It felt a little bit overcomplicated for these small things i worked on, so I was never fully satisfied.

At one point I stumbled over [OneFlow](https://www.endoflineblog.com/oneflow-a-git-branching-model-and-workflow). A great workflow that tries to avoid these redundant tasks. I used it for some weeks and I appreciated the simplicity over GitFlow. The right thing for small web projects. I adapted the logic, extended it to my needs and created WebFlow.

## Commands

### Features

### Releases
There is only one command for creating releases:

**git release c (version)**

```
# create a release named 1.10.0
git release c 1.10.0
```

### Hotfixes


## References