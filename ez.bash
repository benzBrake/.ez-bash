#!/usr/bin/env bash
if [ ${0##*/} == ${BASH_SOURCE[0]##*/} ]; then
    echo "WARNING"
    echo "This script is not meant to be executed directly!"
    echo "Use this script only by sourcing it."
    echo
    exit 1
fi
# Function defined
# Init env
if [[ -z "${EZ_HOME}" ]]; then
    echo "ERROR"
    echo "ENV EZ_HOME not exists. ez-bash would not be run."
else
    # Load theme
    EZ_THEME=${EZ_THEME-benz}
    if [[ -f ${EZ_HOME}/themes/${EZ_THEME}/${EZ_THEME}.bash ]]; then
        . ${EZ_HOME}/themes/${EZ_THEME}/${EZ_THEME}.bash
    fi

    shopt -s nullglob

    # Load aliases
    for file in ${EZ_HOME}/aliases/*; do
        source ${file}
    done

    # Load plugins
    for plugin in ${EZ_PLUGINS}; do
        if [[ -f ${EZ_HOME}/plugins/${plugin}.bash ]]; then
            source ${EZ_HOME}/plugins/${plugin}.bash
        fi
    done

    # Load custom scripts
    for file in ${EZ_HOME}/custom/*; do
        source ${file}
    done

    shopt -u nullglob

    . ${EZ_HOME}/post.bash
fi