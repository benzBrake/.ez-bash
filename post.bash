#!/usr/bin/env bash
# @Description: 最后载入的脚本
### 
# remove background colors from dircolors
if [ -n "$(command -v dircolors)" ]; then
    eval "$(dircolors -p | \
        sed 's/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /' | \
        dircolors /dev/stdin)"
fi
