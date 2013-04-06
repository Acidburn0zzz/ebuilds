# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils

if [[ ${PV} == 9999* ]]
then
	EGIT_REPO_URI="https://code.google.com/p/dolphin-emu/"
	inherit git-2
	KEYWORKD=""
else
	SRC_URI="http://${PN}-emu.googlecode.com/files/${P}-src.zip"
	KEYWORDS="~amd"
fi

DESCRIPTION="Dolphin is a Gamecube and Wii game emulator"
HOMEPAGE="http://www.dolphin-emulator.com/"

LICENSE="GPL-2"
SLOT="0"
IUSE="alsa ao bluetooth ffmpeg openal pulseaudio"

DEPEND="app-arch/zip
	media-gfx/nvidia-cg-toolkit
	media-libs/freetype
	sys-libs/readline
	>=x11-libs/wxGTK-2.9.3.1
	x11-libs/libXext
	alsa? ( media-libs/alsa-lib )
	ao? ( media-libs/libao )
	bluetooth? ( net-wireless/bluez )
	ffmpeg? ( virtual/ffmpeg )
	openal? ( media-libs/openal )
    pulseaudio? ( media-sound/pulseaudio )
	"
RDEPEND="${DEPEND}"

src_install() {
	cmake-utils_src_install
	doicon "${S}/Installer/Dolphin.ico"
}
