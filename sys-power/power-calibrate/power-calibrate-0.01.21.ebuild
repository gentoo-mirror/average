# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
DESCRIPTION="processor power calibration tool"
HOMEPAGE="https://launchpad.net/power-calibrate"
SRC_URI="https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/${PN}/${PV}-1/${PN}_${PV}.orig.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

src_prepare() {
	# prevent compression of manpage (by creating a circular dependency...)
	sed -i "s/${PN}.8.gz/${PN}.8/" Makefile

	default
}
