#!/usr/bin/env bash
if [ -n "$(command -v git)" ]; then
    alias og='less $EZ_HOME/aliases/git.aliases.sh'
    alias ga='git add'
    alias gbr='git branch'
    alias gcam='git commit --amend --no-edit'
    alias gcamend='git commit --amend --no-edit'

    grsth() {
        __ez_confirm "Reset tracked changes in the current repo with 'git reset --hard HEAD'? [y/N] " || {
            echo "Aborted."
            return 1
        }

        command git reset --hard HEAD
    }
fi
