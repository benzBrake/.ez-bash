#!/usr/bin/env bash
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias src='source ~/.bashrc'                # src:          Reload .bashrc file
[[ -n $(command -v vim) ]] && alias vi=vim                                # Use vim instead of vi
[[ -z $(command -v tree) ]] && alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'" # Allow "tree" command anywhere...
function free() {
    if [[ $# -eq 0 ]]; then
        command free -m 2>&1 | sed -e "s#[^0-9][0-9]\+#&M#g" -e "s#total#free: total#" | column -t
    else
        command free $@
    fi
}
