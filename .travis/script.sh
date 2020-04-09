#!/usr/bin/env bash
set -uxo pipefail

case $1 in
    pkgcheck)
        # run repoman checks
        pkgcheck scan --commits --jobs="$(nproc)"
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
