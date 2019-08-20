#!/usr/bin/env bash
[[ -n $(command -v "ps") ]] && {
    alias dps='docker ps'
    alias dpsa='docker ps -a'
    alias dims='docker images'
    alias dkil='docker kill'
}
[[ -n $(command -v "docker-compose") ]] && {
    alias dcdown='docker-compose down'
    alias dcex='docker-compose exec'
    alias dclog='docker-compose logs'
    alias dclf='docker-compose logs -f'
    alias dcstop='docker-compose stop'
    alias dcstart='docker-compose start'
    alias dcps='docker-compose ps'
    alias dcup='docker-compose up -d'
    alias dcrm='docker-compose rm'
}