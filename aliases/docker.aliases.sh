#!/usr/bin/env bash
# Docker 缩写
[[ -n $(command -v "ps") ]] && {
    alias dps='docker ps'
    alias dpsa='docker ps -a'
    alias dims='docker images'
    alias dkil='docker kill'
    alias dci="docker images|grep none|awk '{print $3}'|xargs docker rmi"
}
# Docker Compose 缩写
[[ -n $(command -v "docker-compose") ]] && {
    if [ "$DOCKER_COMPOSE_COMPATIBILITY" == true  ]; then
	alias dc='docker-compose --compatibility'
    else
        alias dc='docker-compose'
    fi
    alias dcd='dc down'
    alias dcr='dc exec'
    alias dcl='dc logs'
    alias dclf='dc logs -f'
    alias dcstop='dc stop'
    alias dcstart='dc start'
    alias dcps='dc ps'
    alias dcup='dc up'
    alias dcupd='dc up -d'
    alias dcrm='dc rm'
    alias dcrmf='dc rm -f'
}
