#!/usr/bin/env bash
###
 # @Author: Ryan
 # @Date: 2021-02-26 08:34:46
 # @LastEditTime: 2021-02-26 08:44:02
 # @LastEditors: Ryan
 # @Description: Docker 缩写
 # @FilePath: \VPSReady\.ez\aliases\docker.aliases.sh
###
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
    alias dc='docker-compose'
    alias dcd='docker-compose down'
    alias dcr='docker-compose exec'
    alias dcl='docker-compose logs'
    alias dclf='docker-compose logs -f'
    alias dcstop='docker-compose stop'
    alias dcstart='docker-compose start'
    alias dcps='docker-compose ps'
    alias dcup='docker-compose up'
    alias dcupd='docker-compose up -d'
    alias dcrm='docker-compose rm'
    alias dcrmf='docker-compose rm -f'
}