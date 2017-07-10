# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A lightweight implementation of Desktop Notification Spec"
HOMEPAGE="https://github.com/mgorny/libtinynotify/"
SRC_URI="https://github.com/mgorny/libtinynotify/releases/download/${P}/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug doc static-libs"

RDEPEND="sys-apps/dbus:0="
DEPEND="${RDEPEND}
	virtual/pkgconfig
	doc? ( >=dev-util/gtk-doc-1.18 )"

DOCS=( README )

src_configure() {
	local myconf=(
		$(use_enable debug)
		$(use_enable doc gtk-doc)
		$(use_enable static-libs static)
	)

	econf "${myconf[@]}"
}

src_install() {
	default
	find "${D}" -name '*.la' -delete
}
