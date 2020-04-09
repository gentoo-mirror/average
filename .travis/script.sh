#!/usr/bin/env bash
set -uxo pipefail

case $1 in
    pkgcheck)
        # run repoman checks
        pkgcheck scan --color=true --jobs="$(nproc)" | tee pkgcheck.out
        [ "$(wc -c pkgcheck.out | cut -f1 -d' ')" -gt 0 ] && exit 1
        ;;

    shellcheck)
        # run shellcheck
        sc_exclude=(
            SC2034  # unused varables
        )

        (   # prevent shopt from leaking
        shopt -s globstar nullglob
        shellcheck --shell=bash --exclude="${sc_exclude[*]}" eclass/*.eclass ./**/*.ebuild
    )
    ;;
esac
