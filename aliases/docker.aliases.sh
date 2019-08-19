#!/usr/bin/env bash
[[ -n $(command -v "ps") ]] && {
    alias dps='docker ps'
    alias dpsa='docker ps -a'
    alias dims='docker images'
    alias dkil='docker kill'
}
[[ -n $(command -v "docker-compose") ]] && {
    alias dcps='docker-compose ps'
    alias dcstop='docker-compose stop'
    alias dcstart='docker-compose start'
    alias dcup='docker-compose up -d'
    alias dcd='docker-compose down'
}
