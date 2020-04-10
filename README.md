# average
[![Build Status](https://travis-ci.com/AnAverageHuman/average.svg?branch=master)](https://travis-ci.com/AnAverageHuman/average)

Personal overlay for Gentoo packages. Changes often due to patches making it
into the main tree. See branches for unfinished projects.

## Installation/Usage

Repositories considered "masters" of this one are not necessary for most of the
packages here.  If the build is passing on Travis but `emerge` fails to resolve
dependencies, you're probably missing one or more of the "master" repositories
and should add it to your system.

I force push often. In the event that `emerge` or `layman` refuses to sync,
either remove and re-add the repository, or manually enter the directory and run
as the appropriate user:

```sh
git fetch --all && git reset --hard origin/master
```

### eselect-repository

See [the wiki](https://wiki.gentoo.org/wiki/Eselect/Repository) for more information.

```sh
emerge --ask app-eselect/eselect-repository
eselect repository add average git https://github.com/AnAverageHuman/average.git
emerge --sync
```

### layman

```sh
emerge --ask app-portage/layman
layman -of https://raw.githubusercontent.com/AnAverageHuman/average/master/repositories.xml -a average
layman -s average
```

## Packages

See the automatically generated package table in
[Packages.adoc](../travis-artifacts/Packages.adoc)
for a complete listing.

The following packages require extra explanation:

### dev-embedded

**arduino-libs**: Adds libraries and hardware as specified in the
[ADK documentation](https://developer.android.com/adk/adk.html). Never tested.
