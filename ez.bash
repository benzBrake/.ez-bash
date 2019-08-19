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
if [[ -z ${EZ_HOME} ]]; then
    echo "ERROR"
    echo "ENV EZ_HOME not exists."
    echo "Please set EZ_HOME to make ez-bash avaliable."
    echo
else
    # Load theme
    if [[ ! -z ${EZ_THEME} ]]; then
        if [[ -f ${EZ_HOME}/themes/${EZ_THEME}/${EZ_THEME}.bash ]]; then
            source ${EZ_HOME}/themes/${EZ_THEME}/${EZ_THEME}.bash
        fi
    fi
    # Load aliases
    for file in $(/bin/ls $EZ_HOME/aliases/); do
        source ${EZ_HOME}/aliases/${file}
    done
    # Load plugins
    for plugin in ${EZ_PLUGINS}; do
	source ${EZ_HOME}/plugins/${plugin}.bash
    done
    # Load functions
    source ${EZ_HOME}/functions.bash
    source ${EZ_HOME}/enhanced.bash
    # Load custiom scripts
    for file in $(/bin/ls $EZ_HOME/custom/); do
        source ${EZ_HOME}/custom/${file}
    done 
fi
