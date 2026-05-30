# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Virtual for OpenClaw Playwright Chromium runtime dependencies (headless)"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	dev-libs/atk
	dev-libs/nss
	dev-libs/nspr
	app-accessibility/at-spi2-core
	media-libs/mesa
	net-print/cups
	x11-libs/libxcb
	x11-libs/libxkbcommon
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXfixes
	x11-libs/libXrandr
"
