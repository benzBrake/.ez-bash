#!/usr/bin/env bash
# define functions
function _fish_collapsed_pwd() {
    local pwd="$1"
    local home="$HOME"
    local size=${#home}
    [[ $# == 0 ]] && pwd="$PWD"
    [[ -z "$pwd" ]] && return
    if [[ "$pwd" == "/" ]]; then
        echo "/"
        return
    elif [[ "$pwd" == "$home" ]]; then
        echo "~"
        return
    fi
    [[ "$pwd" == "$home/"* ]] && pwd="~${pwd:$size}"
    if [[ -n "$BASH_VERSION" ]]; then
        local IFS="/"
        local elements=($pwd)
        local length=${#elements[@]}
        for ((i=0;i<length-1;i++)); do
            local elem=${elements[$i]}
            if [[ ${#elem} -gt 1 ]]; then
                elements[$i]=${elem:0:1}
            fi
        done
    else
        local elements=("${(s:/:)pwd}")
        local length=${#elements}
        for i in {1..$((length-1))}; do
            local elem=${elements[$i]}
            if [[ ${#elem} > 1 ]]; then
                elements[$i]=${elem[1]}
            fi
        done
    fi
    local IFS="/"
    echo "${elements[*]}"
}
# custom prompt
if [ -n "$BASH_VERSION" ]; then
    if [ "$UID" -eq 0 ]; then
        export PS1='\[\e[38;5;135m\]\u\[\e[0m\]@\[\e[38;5;166m\]\h\[\e[0m\] \[\e[38;5;118m\]$(_fish_collapsed_pwd)\[\e[0m\]# '
    else
        export PS1='\[\e[38;5;135m\]\u\[\e[0m\]@\[\e[38;5;166m\]\h\[\e[0m\] \[\e[38;5;118m\]$(_fish_collapsed_pwd)\[\e[0m\]> '
    fi
else
    if [ $UID -eq 0 ]; then
        export PROMPT='%F{135}%n%f@%F{166}%m%f %F{1}$(_fish_collapsed_pwd)%f# '
    else
        export PROMPT='%F{135}%n%f@%F{166}%m%f %F{2}$(_fish_collapsed_pwd)%f> '
    fi
fi
