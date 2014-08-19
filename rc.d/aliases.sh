# trick to make aliases available when using sudo
alias sudo='sudo '

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
  alias psc='ps xao pid,user,args'
elif [[ "$(uname)" == "Linux" ]]; then
  alias psc='ps xawfo pid,user,args'
fi

# alias for using rsync with sudo and ssh
alias rrsync='rsync --rsync-path sudo\ rsync -rvze ssh'

# sum (e.g. echo 1 2 3 |sum)
alias sum="xargs | tr ' ' '+' | bc"

# alias ag to ack/grep if ag is not available
if ! which ag &> /dev/null; then
  # Use ack if available
  if which ack &> /dev/null; then
    alias ag='ack'

  # Debian/Ubuntu executeable name is ack-grep
  elif which ack-grep &> /dev/null; then
    alias ag='ack-grep'

  # Fallback to grep -R
  else
    ag() { grep -R $1 *; }
  fi
fi

# syntax highlight
if which pygmentize &> /dev/null; then
  alias hcat='pygmentize -g -O style=trac -f terminal256'
fi
