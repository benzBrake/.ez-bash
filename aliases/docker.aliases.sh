#!/usr/bin/env bash
# ------------- Docker 环境判断 -------------
# 返回能用的 compose 命令字符串（docker-compose 或 docker compose）
__find_compose_cmd() {
    # 优先用 docker-compose v1，没有再用 docker compose v2
    if command -v docker-compose &>/dev/null; then
        echo "docker-compose"
    elif docker compose version &>/dev/null 2>&1; then
        echo "docker compose"
    else
        echo ""
    fi
}

# 只有本机装了 docker 才加载别名
if command -v docker &>/dev/null; then
    # --- 常规 docker 别名 ---
    alias dps='docker ps'
    alias dpsa='docker ps -a'
    alias dims='docker images'
    alias dkil='docker kill'
    # 清理 <none> 镜像
    dci() { docker images | awk '$1=="<none>"{print $3}' | xargs -r docker rmi; }

    # --- compose 别名（自动兼容 v1 / v2，动态检测） ---
    # 通用 dispatcher，每次调用时动态检测 compose 命令
    __dc_dispatcher() {
        local cmd=$(__find_compose_cmd)
        if [[ -n "$cmd" ]]; then
            $cmd "$@"
        else
            echo "Error: docker-compose not installed" >&2
            return 1
        fi
    }

    # 检测是否有可用的 compose 命令（避免无用的别名定义）
    if [[ -n $(__find_compose_cmd) ]]; then
        dcd() {
            if [[ $# -eq 0 ]]; then
                __dc_dispatcher down
                return
            fi

            __dc_dispatcher stop "$@" &&
                __dc_dispatcher rm -f "$@"
        }

        # 用 eval 一次性生成所有 compose 别名，以后加命令只改这里
        eval "
            alias dc='__dc_dispatcher'
            alias dcr='__dc_dispatcher exec'
            alias dcl='__dc_dispatcher logs'
            alias dclf='__dc_dispatcher logs -f'
            alias dcstop='__dc_dispatcher stop'
            alias dcstart='__dc_dispatcher start'
            alias dcps='__dc_dispatcher ps'
            alias dcup='__dc_dispatcher up'
            alias dcupd='__dc_dispatcher up -d'
            alias dcrm='__dc_dispatcher rm'
            alias dcrmf='__dc_dispatcher rm -f'
        "
    fi
fi
