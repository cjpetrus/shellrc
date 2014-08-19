# shell version of ord() and chr()
ord() { printf "0x%x\n" "'$1"; }
chr() { printf $(printf '\\%03o\\n' "$1"); }

# highlight text
highlight() { e="$1"; shift; grep --color=always -Eih "$e|$" "$@"; }

# grep process table
psgrep() { psc |grep -v grep |grep -i --color=auto "$@"; }

pspid() { ps xao pid,args |grep -v grep |grep -i "$@" |awk '{print $1}'; }

# killall alternative
pskill() {
  # Check whether a signal was given
  if [[ "$1" =~ '^-[[:alnum:]]+' ]]; then
    SIGNAL=$1
    shift
  else
    SIGNAL="-TERM"
  fi

  PIDS=$(pspid $@)
  if [ -n "$PIDS" ]; then
    echo $PIDS |xargs kill $SIGNAL
  else
    echo "No processes matching '$@' found" 1>&2
  fi
}
