#!/usr/bin/env bash
# @Description: 最后载入的脚本
###
# remove background colors from dircolors
if command -v dircolors >/dev/null 2>&1; then
    if [ -f ~/.dircolors ]; then
        eval "$(dircolors ~/.dircolors)"
    else
        # 创建一个临时文件
        temp_file=$(mktemp)

        # 使用 dircolors -p 和 sed 生成修改后的输出并写入临时文件
        dircolors -p | sed 's/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /' > "$temp_file"

        # 使用 dircolors 加载临时文件
        eval "$(dircolors "$temp_file")"

        # 删除临时文件
        rm -f "$temp_file"
    fi
fi