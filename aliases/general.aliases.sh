#!/usr/bin/env bash
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias src='source ~/.bashrc'                # src:          Reload .bashrc file
command -v vim >/dev/null 2>&1 && alias vi='vim'                          # Use vim instead of vi
command -v tree >/dev/null 2>&1 || alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'" # Allow "tree" command anywhere...
function free() {
    if [[ $# -eq 0 ]]; then
        command free -m 2>&1 | sed -e "s#[^0-9][0-9]\+#&M#g" -e "s#total#free: total#" | column -t
    else
        command free "$@"
    fi
}
