# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Nim forum"
HOMEPAGE="https://github.com/nim-lang/nimforum"
EGIT_REPO_URI="https://github.com/nim-lang/nimforum"
EGIT_COMMIT="d5892db6476a5636cd5a447ae1d646e619d7090a"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-lang/nim-0.14.0
	dev-nim/bcrypt-nim
	dev-nim/cairo-nim
	dev-nim/jester
"
RDEPEND=""

src_compile() {
	nim c -d:release -p:"\$lib/packages/bcrypt" -p:"\$lib/packages/cairo" -p:"\$lib/packages/jester" forum.nim || die "compile failed"
	nim c -d:release createdb.nim || die "compile failed"
}

src_install() {
	dodir /usr/bin
	exeinto /usr/bin
	newexe forum ${PN}
	newexe createdb ${PN}-createdb
	dodir /usr/share/${PN}
	insinto /usr/share/${PN}
	doins -r public static
	ewarn "To run nimforum, create a directory, copy into it the contents of /usr/share/${PN} and run ${PN}-createdb and ${PN} inside it."
}
