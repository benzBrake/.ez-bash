#!/usr/bin/env bash
# add default args for command df
function df() {
    if [[ $# -eq 0 ]]; then
        command df -h
    else
        command df $*
    fi
}
# Make and cd directory
function mcd() {
    if [[ $# -eq 0 ]]; then
        echo mcd: missing operand
    elif [[ $# -eq 1 ]]; then
        mkdir -pv $1
        cd $1
    else
        echo mcd: too much operand
    fi
}
