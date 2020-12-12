# Copyright 2017-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.1

EAPI=7

CRATES="
ansi_term-0.11.0
anyhow-1.0.33
arrayref-0.3.6
arrayvec-0.5.1
atty-0.2.14
autocfg-1.0.1
base64-0.12.3
bitflags-1.2.1
blake2b_simd-0.5.10
cc-1.0.60
cfg-if-0.1.10
chrono-0.4.19
clap-2.33.3
constant_time_eq-0.1.5
crossbeam-channel-0.4.4
crossbeam-utils-0.7.2
dirs-2.0.2
dirs-sys-0.3.5
getrandom-0.1.15
git2-0.13.11
hermit-abi-0.1.17
idna-0.2.0
jobserver-0.1.21
lazy_static-1.4.0
libc-0.2.79
libgit2-sys-0.12.13+1.0.1
libz-sys-1.1.2
log-0.4.11
matches-0.1.8
maybe-uninit-2.0.0
memchr-2.3.3
num-integer-0.1.43
num-traits-0.2.12
percent-encoding-2.1.0
pkg-config-0.3.18
ppv-lite86-0.2.9
rand-0.7.3
rand_chacha-0.2.2
rand_core-0.5.1
rand_hc-0.2.0
redox_syscall-0.1.57
redox_users-0.3.5
remove_dir_all-0.5.3
rust-argon2-0.8.2
slog-2.5.2
slog-async-2.5.0
slog-term-2.6.0
strsim-0.8.0
take_mut-0.2.2
tempfile-3.1.0
term-0.6.1
textwrap-0.11.0
thread_local-1.0.1
time-0.1.44
tinyvec-0.3.4
unicode-bidi-0.3.4
unicode-normalization-0.1.13
unicode-width-0.1.8
url-2.1.1
vcpkg-0.2.10
vec_map-0.8.2
wasi-0.10.0+wasi-snapshot-preview1
wasi-0.9.0+wasi-snapshot-preview1
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit bash-completion-r1 cargo

DESCRIPTION="git commit --fixup, but automatic"
HOMEPAGE="https://crates.io/crates/git-absorb"
SRC_URI="https://github.com/tummychow/git-absorb/archive/0.6.6.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/libgit2"
RDEPEND=""

src_compile() {
	export LIBGIT2_SYS_USE_PKG_CONFIG=1
	cargo_src_compile

	einfo "Building completions"
	cargo run "$(usex debug "" --release)" -- --gen-completions bash > "${PN}".bash-completion || die
	cargo run "$(usex debug "" --release)" -- --gen-completions zsh > "${PN}".zsh-completion || die
}

src_install() {
	cargo_src_install

	dodoc README.md
	# precompiled manpage to skip dependency on asciidoc
	doman Documentation/"${PN}".?

	newbashcomp "${PN}".bash-completion "${PN}"
	insinto /usr/share/zsh/site-functions
	newins "${PN}".zsh-completion _"${PN}"
}
