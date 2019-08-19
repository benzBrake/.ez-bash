#!/usr/bin/env bash
function __instpy() {
    if [[ $# -eq 1 ]]; then
        v=$1
        [[ ! -f ~/.pyenv/cache/Python-$v.tar.xz ]] && wget http://npm.taobao.org/mirrors/python/$v/Python-$v.tar.xz -P ~/.pyenv/cache/
        pyenv install $v 
    else
        echo "Error: Wrong arguments"
        echo "Usage: instpy [python version]"
    fi
}
function __listpyol() {
    if [[ $# -eq 1 ]]; then
        pyenv install --list | grep $1
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
