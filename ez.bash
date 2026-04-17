#!/usr/bin/env bash
if [ "${0##*/}" = "${BASH_SOURCE[0]##*/}" ]; then
    echo "WARNING"
    echo "This script is not meant to be executed directly!"
    echo "Use this script only by sourcing it."
    echo
    exit 1
fi
# Init env
if [[ -z "${EZ_HOME}" ]]; then
    echo "ERROR"
    echo "ENV EZ_HOME not exists. ez-bash would not be run."
else
    __ez_source_files() {
        local file

        for file in "$@"; do
            [[ -f "$file" ]] && . "$file"
        done
    }

    EZ_THEME="${EZ_THEME:-benz}"

    if [[ -f "${EZ_HOME}/functions.bash" ]]; then
        . "${EZ_HOME}/functions.bash"
    fi

    # Load theme
    if [[ -f "${EZ_HOME}/themes/${EZ_THEME}/${EZ_THEME}.bash" ]]; then
        . "${EZ_HOME}/themes/${EZ_THEME}/${EZ_THEME}.bash"
    fi

    shopt -s nullglob

    # Load aliases
    __ez_source_files "${EZ_HOME}"/aliases/*.bash "${EZ_HOME}"/aliases/*.sh

    # Load plugins
    for plugin in ${EZ_PLUGINS}; do
        if [[ -f "${EZ_HOME}/plugins/${plugin}.bash" ]]; then
            . "${EZ_HOME}/plugins/${plugin}.bash"
        fi
    done

    # Load custom scripts
    __ez_source_files "${EZ_HOME}"/custom/*.bash "${EZ_HOME}"/custom/*.sh

    shopt -u nullglob

    if [[ -f "${EZ_HOME}/post.bash" ]]; then
        . "${EZ_HOME}/post.bash"
    fi
fi
