# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="SOCKS5 proxy over SSL with transparent proxy support"
HOMEPAGE="https://github.com/windfail/ssl-socks"
EGIT_REPO_URI="https://github.com/windfail/ssl-socks"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/openssl
	dev-libs/boost:0
	sys-devel/gcc:=[cxx]
"
RDEPEND="${DEPEND}
	net-firewall/nftables
"
BDEPEND="
	dev-build/cmake
	virtual/pkgconfig
"
