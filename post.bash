#!/usr/bin/env bash
###
 # @Author: Ryan
 # @Date: 2021-02-26 08:45:51
 # @LastEditTime: 2021-02-26 08:46:34
 # @LastEditors: Ryan
 # @Description: 最后载入的脚本
 # @FilePath: \VPSReady\.ez\post.bash
### 
# remove background colors from dircolors
eval "$(dircolors -p | \
    sed 's/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /' | \
    dircolors /dev/stdin)"