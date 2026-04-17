#!/usr/bin/env bash
__ez_compose() {
    if command -v docker-compose >/dev/null 2>&1; then
        command docker-compose "$@"
    elif docker compose version >/dev/null 2>&1; then
        command docker compose "$@"
    else
        echo "Error: docker compose is not installed" >&2
        return 1
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

    # --- compose 命令（自动兼容 v1 / v2，动态检测） ---
    if __ez_compose version >/dev/null 2>&1; then
        dc() {
            __ez_compose "$@"
        }

        dcr() {
            __ez_compose exec "$@"
        }

        dcl() {
            __ez_compose logs "$@"
        }

        dclf() {
            __ez_compose logs -f "$@"
        }

        dcstop() {
            __ez_compose stop "$@"
        }

        dcstart() {
            __ez_compose start "$@"
        }

        dcps() {
            __ez_compose ps "$@"
        }

        dcup() {
            __ez_compose up "$@"
        }

        dcupd() {
            __ez_compose up -d "$@"
        }

        dcrm() {
            __ez_compose rm "$@"
        }

        dcrmf() {
            __ez_compose rm -f "$@"
        }

        dcd() {
            if [[ $# -eq 0 ]]; then
                __ez_compose down
                return
            fi

            __ez_compose stop "$@" &&
                __ez_compose rm -f "$@"
        }
    fi
fi
