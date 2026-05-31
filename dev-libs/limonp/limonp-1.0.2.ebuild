# Copyright 2026-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Header-only C++ utility library used by cppjieba"
HOMEPAGE="https://github.com/yanyiwu/limonp"
SRC_URI="https://github.com/yanyiwu/limonp/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

inherit cmake

BDEPEND=">=dev-build/cmake-3.14"

src_configure() {
    local mycmakeargs=(
        -DENABLE_UNIT_TESTS=OFF
        -DBUILD_TESTING=OFF
    )
    cmake_src_configure
}

src_compile() {
    cmake_src_compile
}

src_install() {
    cmake_src_install
}
