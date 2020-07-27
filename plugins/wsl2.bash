#!/bin/bash
# 1.Fix network issue
export WSL_HOST_IP=$(grep nameserver /etc/resolv.conf | awk '{print $2}')
CIDR=$(ip addr show eth0 | grep -Eo '(([1-9]{1,3}\.){1,3}[0-9]{1,3}/)([0-9]){1,2}' | awk -F '/' '{print $2}')
if [[ $CIDR -ne 20 ]]; then
    ifconfig eth0 netmask 255.255.240.0
    ip route add default via ${WSL_HOST_IP} 
fi
# 2.Set display environment
export DISPLAY=$(grep nameserver /etc/resolv.conf | awk '{print $2}'):0
# 3.Run OpenSSH server
[[ -f /usr/sbin/sshd ]] && [[ $(ps -ef | grep -v grep | grep /usr/sbin/sshd | wc -l) -eq 0 ]] && /usr/sbin/sshd
# 4. Fix ls output
alias ls='command ls --human-readable --group-directories-first --color=auto -I NTUSER.DAT\* -I ntuser.dat\* 2>/dev/null'