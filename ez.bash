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
    EZ_THEME=${EZ_THEME-agnoster}
    if [[ -f ${EZ_HOME}/themes/${EZ_THEME}/${EZ_THEME}.bash ]]; then
        . ${EZ_HOME}/themes/${EZ_THEME}/${EZ_THEME}.bash
    fi

    # Load aliases
    for file in $(/bin/ls ${EZ_HOME}/aliases/); do
        . ${EZ_HOME}/aliases/${file}
    done
    # Load plugins
    for plugin in ${EZ_PLUGINS}; do
        . ${EZ_HOME}/plugins/${plugin}.bash
    done
    # Load functions
    . ${EZ_HOME}/functions.bash
    # Load custiom scripts
    for file in $(/bin/ls $EZ_HOME/custom/ 2>/dev/null); do
        . ${EZ_HOME}/custom/${file}
    done
    . ${EZ_HOME}/post.bash
fi
