# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="dart-sdk"

DESCRIPTION="A client-optimized langauge for fast apps on any platform"
HOMEPAGE="https://dart.dev/"

BASE_URI="https://storage.googleapis.com/dart-archive/channels/stable/release/${PV}/sdk"
SRC_URI="
	amd64? ( ${BASE_URI}/dartsdk-linux-x64-release.zip )
	arm? ( ${BASE_URI}/dartsdk-linux-arm-release.zip )
	arm64? ( ${BASE_URI}/dartsdk-linux-arm64-release.zip )
	x86? ( ${BASE_URI}/dartsdk-linux-ia32-release.zip )
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="-* ~amd64"

BDEPEND="app-arch/unzip"

S="${WORKDIR}/${MY_PN}"

src_prepare() {
	default

	# force canonicalization of symlinks
	sed -i 's/$(readlink/$(readlink -f/' bin/dart* bin/pub || die
}

src_install() {
	rm bin/dart bin/dart.bat || die

	mkdir "${ED}/opt" || die
	mv "${S}" "${ED}/opt/" || die

	for i in "${ED}/opt/${MY_PN}/bin"/dart* pub; do
		dosym "../${MY_PN}/bin/${i##*/}" "/opt/bin/${i##*/}"
	done
}
