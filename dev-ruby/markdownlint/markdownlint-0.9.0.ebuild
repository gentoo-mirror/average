# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY=( ruby2{4,5,6} )

RUBY_FAKEGEM_EXTRADOC="README.md CHANGELOG.md"
RUBY_FAKEGEM_GEMSPEC="mdl.gemspec"

inherit ruby-fakegem

DESCRIPTION="A tool to check markdown files and flag style issues."
HOMEPAGE="https://github.com/markdownlint/markdownlint"
SRC_URI="https://github.com/markdownlint/markdownlint/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror"

ruby_add_rdepend "
	>=dev-ruby/kramdown-2.0
	>=dev-ruby/mixlib-config-2.2.1
	>=dev-ruby/mixlib-cli-2.1.1
"
