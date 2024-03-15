#!/usr/bin/env bash
# Docker 缩写
[[ -n $(command -v "docker") ]] && {
    alias dps='docker ps'
    alias dpsa='docker ps -a'
    alias dims='docker images'
    alias dkil='docker kill'
    function dci() {
        docker images | grep none | awk '{print $3}' | xargs docker rmi
    }
    alias dc='docker compose'
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
