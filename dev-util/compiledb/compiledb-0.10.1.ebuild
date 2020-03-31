# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_6 )

inherit distutils-r1
DESCRIPTION="Generate Clang's JSON Compilation Database files for make-based build systems"
HOMEPAGE="https://github.com/nickdiego/compiledb"
SRC_URI="https://codeload.github.com/nickdiego/${PN}/tar.gz/v${PV} -> ${PN}-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/bashlex[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
DOCS=( README.md )
