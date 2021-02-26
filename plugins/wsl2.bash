#!/bin/bash
###
 # @Author: Ryan
 # @Date: 2021-02-26 08:52:38
 # @LastEditTime: 2021-02-26 08:57:45
 # @LastEditors: Ryan
 # @Description: pyenv 国内优化插件
 # @FilePath: \VPSReady\.ez\plugins\wsl2.bash
### 
function __instpy() {
    if [[ $# -eq 1 ]]; then
        v=$1
        [[ ! -f "$HOME/.pyenv/cache/Python-$v.tar.xz" ]] && wget "http://npm.taobao.org/mirrors/python/$v/Python-$v.tar.xz" -P "$HOME/.pyenv/cache/"
        pyenv install "$v"
    else
        echo "Error: Wrong arguments"
        echo "Usage: instpy [python version]"
    fi
}
function __listpyol() {
    if [[ $# -eq 1 ]]; then
        pyenv install --list | grep "$1"
    else
        pyenv install --list
    fi
}
if [[ ! -f $HOME/.pyenv/bin/pyenv ]]; then
    printf "Program pyenv is not found on this system.\n"
    printf "You can disable ez-bash plugin pyenv.\n"
else
    alias lspy='pyenv versions'         # List installed pythons' version
    alias lspyol='__listpyol'           # List pythons avaliable online
    alias instpy='__instpy'             # Install specify version of python
fi