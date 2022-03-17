#!/usr/bin/env bash
if [ -n "$(command -v git)" ]; then
    alias og='less $EZ_HOME/aliases/git.aliases.sh'
    alias ga='git add'
    alias gc='git commit -v'
    alias gd='git diff'
    alias gst='git status'
    alias gcl='git clone'
    alias gch='git checkout'
    alias gcm='git checkout master'
    alias gps='git push'
    alias gpu='git pull'
fi
