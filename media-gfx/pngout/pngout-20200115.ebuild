# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker

DESCRIPTION="PNGOUT optimizes the size of .PNG files losslessly."
HOMEPAGE="https://www.jonof.id.au/kenutils.html"
SRC_URI="https://www.jonof.id.au/files/kenutils/${P}-linux.tar.gz"

LICENSE="pngout"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE=""
RESTRICT="bindist"

QA_PREBUILT="*"

RDEPEND=""
DEPEND=${RDEPEND}

S="${WORKDIR}/${P}-linux"

src_install() {
	exeinto /opt/bin
	use amd64 && doexe "amd64/${PN}"
	use x86   && doexe "i686/${PN}"
	use arm   && doexe "armv7/${PN}"
	use arm64 && doexe "aarch64/${PN}"

	dodoc readme.txt
}
