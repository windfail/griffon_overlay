# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit autotools

DESCRIPTION="Shairport Sync is an AirPlay audio player"
HOMEPAGE="https://github.com/mikebrady/shairport-sync"
SRC_URI="https://github.com/mikebrady/shairport-sync/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"

SLOT="0"

KEYWORDS="~amd64"

IUSE="alsa pulseaudio jack soundio soxr alac openssl mbedtls convolution pipewire airplay2"
REQUIRED_USE="|| ( alsa pulseaudio jack pipewire ) ^^ ( openssl mbedtls )"

RDEPEND="
	acct-user/shairport-sync
	acct-group/shairport-sync
	dev-libs/libconfig
	openssl? ( dev-libs/openssl )
	mbedtls? ( net-libs/mbedtls )
	net-dns/avahi
	soxr? ( media-libs/soxr )
	alsa? ( media-libs/alsa-lib )
	alac? ( media-libs/alac )
	pipewire? ( media-video/pipewire )
	pulseaudio? ( media-sound/pulseaudio )
	soundio? ( media-libs/libsoundio )
	dev-libs/libdaemon
	convolution? ( media-libs/libsndfile )
	jack? ( virtual/jack )
"

DEPEND="${RDEPEND}"

src_configure() {
	autoreconf -i -f
	local myconf
	if use openssl ;then
		myconf="$myconf --with-ssl=openssl"
	elif use mbedtls ;then
		myconf="$myconf --with-ssl=mbedtls"
	fi
	econf \
		--with-avahi \
		--with-metadata \
		--with-pipe \
		--with-stdout \
		--with-systemd \
		--with-systemv \
		--with-libdaemon \
		$(use_with alsa) \
		$(use_with jack) \
		$(use_with pulseaudio pa) \
		$(use_with pipewire pw) \
		$(use_with soundio) \
		$(use_with soxr) \
		$(use_with alac apple-alac) \
		$(use_with convolution) \
		$(use_with airplay2 airplay-2) \
		$myconf
}
