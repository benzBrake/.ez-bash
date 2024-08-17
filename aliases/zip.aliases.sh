#!/usr/bin/env bash
zip_date() {
    local format=""
    local OPTIND

    while getopts "f:" opt; do
        case $opt in
            f) format="$OPTARG" ;;
            *) echo "Usage: zip_date [-f format] dir" && return 1 ;;
        esac
    done
    shift $((OPTIND - 1))

    local dir="$1"
    if [ -z "$dir" ]; then
        echo "Usage: zip_date [-f format] dir"
        return 1
    fi

    format="${format:-$dir-$(date +%Y%m%d)}.zip"

    zip -r "$format" "$dir"
}