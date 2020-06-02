# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Extract internal representation from EFI and UEFI drivers/applications"
HOMEPAGE="https://github.com/LongSoft/Universal-IFR-Extractor"
SRC_URI="https://github.com/LongSoft/Universal-IFR-Extractor/archive/v${PV}.tar.gz -> ${P}.tar.gz"

inherit cmake

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
"
DEPEND="${RDEPEND}"

S=${WORKDIR}/Universal-IFR-Extractor-${PV}

src_install() {
	dobin "${BUILD_DIR}/ifrextract"
	einstalldocs
}
