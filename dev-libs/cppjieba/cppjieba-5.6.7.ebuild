# Copyright 2026-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="C++ Chinese text segmentation library (Jieba)"
HOMEPAGE="https://github.com/yanyiwu/cppjieba"
SRC_URI="https://github.com/yanyiwu/cppjieba/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=dev-libs/limonp-1.0.2"
DEPEND="${RDEPEND}"
inherit cmake

BDEPEND=">=dev-build/cmake-3.14"

src_prepare() {
    cmake_src_prepare
    # Remove bundled limonp - use system one via find_package
    rm -rf "${S}/deps/limonp" || die
}

src_configure() {
    local mycmakeargs=(
        -DCPPJIEBA_TOP_LEVEL_PROJECT=OFF
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
