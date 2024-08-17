#!/usr/bin/env bash
uname -a | grep microsoft > /dev/null
if [ "$?" -eq 0 ]; then
    alias e.="explorer.exe ."
fi