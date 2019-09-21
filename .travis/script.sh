#!/usr/bin/env bash
set -uxo pipefail

PORTAGE_VER=$(curl -sH "Authorization: Bearer ${GITHUB_TOKEN}" -X POST -d '{"query":"{repository(owner:\"gentoo\",name:\"portage\"){refs(refPrefix:\"refs/tags/\",first:1,orderBy:{field:TAG_COMMIT_DATE,direction:DESC}){nodes{name}}}}"}' https://api.github.com/graphql | grep -Po '"name":\s?"\K.*?(?=")')
PORTAGE_URL="https://codeload.github.com/gentoo/portage/tar.gz/${PORTAGE_VER}"

# grab dependencies
wget -q "https://raw.githubusercontent.com/mrueg/repoman-travis/master/spinner.sh"
curl -so portage.tar.gz "${PORTAGE_URL}"
curl -s "https://codeload.github.com/gentoo-mirror/gentoo/tar.gz/master" | tar xz -C /var/db/repos/gentoo --strip-components=1

pip install "${PORTAGE_URL}"

tar xzf portage.tar.gz -C ~/portage --strip-components=1
mkdir -p /etc/portage/repos.conf
ln -s "${HOME}/portage/cnf/repos.conf" /etc/portage/repos.conf/gentoo.conf
sudo ln -s "${HOME}/portage/bin" /usr/lib/portage/bin

chmod a+rwx spinner.sh

# grab repositories we depend on
pushd /var/db/repos || exit

git clone --depth=1 https://github.com/gentoo-mirror/graaff.git
sudo chmod a+rwX graaff
popd || exit
sudo ln -s "$(pwd)/.travis/myrepos.conf" /etc/portage/repos.conf/

# run repoman checks
./spinner.sh "python3 ${HOME}/portage/repoman/bin/repoman -dx full"

# run shellcheck
sc_exclude=(
    SC2034  # unused varables
)

(   # prevent shopt from leaking
    shopt -s globstar nullglob
    shellcheck --shell=bash --exclude="${sc_exclude[*]}" eclass/*.eclass ./**/*.ebuild
)
