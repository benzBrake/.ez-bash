#!/usr/bin/env bash
if [ -n "$(command -v git)" ]; then
    alias og='less $EZ_HOME/aliases/git.aliases.sh'
    alias ga='git add'
    alias gbr='git branch'
    alias gcam='git commit --amend --no-edit'
    alias gcamend='git commit --amend --no-edit'
    alias grsth='git reset --hard HEAD'
fi