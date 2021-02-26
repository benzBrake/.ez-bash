#!/usr/bin/env bash
###
 # @Author: Ryan
 # @Date: 2021-02-26 08:45:18
 # @LastEditTime: 2021-02-26 08:49:03
 # @LastEditors: Ryan
 # @Description: 一些自定义函数
 # @FilePath: \VPSReady\.ez\functions.bash
### 
# add default args for command df
function df() {
    if [[ $# -eq 0 ]]; then
        command df -h
    else
        command df "$@"
    fi
}
# Make and cd directory
function mcd() {
    if [[ $# -eq 0 ]]; then
        echo mcd: missing operand
    elif [[ $# -eq 1 ]]; then
        mkdir -pv "${1}"
        cd "${1}" || echo "Cannot change to directory $1"
    else
        echo mcd: too much operand
    fi
}