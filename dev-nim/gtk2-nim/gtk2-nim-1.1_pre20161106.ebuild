# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Nim bindings for GTK+ 2"
HOMEPAGE="https://github.com/nim-lang/gtk2"
EGIT_REPO_URI="https://github.com/nim-lang/gtk2"
EGIT_COMMIT="048bb4c3896f5b681096fb8b35d53ddf6af25104"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>dev-lang/nim-0.9.2
	dev-nim/cairo-nim
	x11-libs/gtk+:2
"
RDEPEND=""

src_install() {
	dodir /usr/share/nim/lib/packages/gtk2
	insinto /usr/share/nim/lib/packages/gtk2
	doins -r src/*
}
