#!/usr/bin/env bash
alias ls='command ls --human-readable --group-directories-first --color=auto -I NTUSER.DAT\* -I ntuser.dat\* 2>/dev/null'
alias ll='ls -l'
alias la='ll -a'
alias lr='ll -r'
