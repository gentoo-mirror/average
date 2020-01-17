# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

MY_PV=$(ver_cut 1-3)$(ver_cut 5)
MY_P=${PN}-${MY_PV}

DESCRIPTION="The uncompromising Python code formatter"
HOMEPAGE="https://black.readthedocs.io/en/stable/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=""
DEPEND="${PYTHON_DEPS}
	dev-python/appdirs[${PYTHON_USEDEP}]
	>=dev-python/attrs-18.1.0[${PYTHON_USEDEP}]
	>=dev-python/click-6.5[${PYTHON_USEDEP}]
	>=dev-python/pathspec-0.6[${PYTHON_USEDEP}]
	dev-python/regex[${PYTHON_USEDEP}]
	>=dev-python/toml-0.9.4[${PYTHON_USEDEP}]
	>=dev-python/typed-ast-1.4.0[${PYTHON_USEDEP}]
	dev-python/setuptools_scm[${PYTHON_USEDEP}]
"

S=${WORKDIR}/${MY_P}

distutils_enable_tests setup.py
