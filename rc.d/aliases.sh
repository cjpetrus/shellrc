# common ls aliases
alias ll='ls -hal'
alias la='ls -A'
alias l='ls -CF'

# always use vimproved
alias vi='vim'

# use colordiff if available
if which colordiff &> /dev/null; then
  alias diff='colordiff'
fi

# hexdump using od
alias hd='od -Ax -tx1z -v'

# alias for nice ps output (macos/linux versions)
if [[ "$(uname)" == "Darwin" ]]; then
  alias psc='ps -xao pid,user,args'
elif [[ "$(uname)" == "Linux" ]]; then
  alias psc='ps -xawfeo pid,user,cgroup,args'
fi

# alias for using rsync with sudo and ssh
alias rrsync='rsync --rsync-path sudo\ rsync -rvze ssh'

# sum (e.g. echo 1 2 3 |sum)
alias sum="xargs | tr ' ' '+' | bc"
