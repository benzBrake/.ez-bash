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

    # --- compose 别名（自动兼容 v1 / v2） ---
    COMPOSE_CMD=$(__find_compose_cmd)
    if [[ -n $COMPOSE_CMD ]]; then
        # 用 eval 一次性生成所有 compose 别名，以后加命令只改这里
        eval "
            alias dc='$COMPOSE_CMD'
            alias dcd='$COMPOSE_CMD down'
            alias dcr='$COMPOSE_CMD exec'
            alias dcl='$COMPOSE_CMD logs'
            alias dclf='$COMPOSE_CMD logs -f'
            alias dcstop='$COMPOSE_CMD stop'
            alias dcstart='$COMPOSE_CMD start'
            alias dcps='$COMPOSE_CMD ps'
            alias dcup='$COMPOSE_CMD up'
            alias dcupd='$COMPOSE_CMD up -d'
            alias dcrm='$COMPOSE_CMD rm'
            alias dcrmf='$COMPOSE_CMD rm -f'
        "
    fi
fi