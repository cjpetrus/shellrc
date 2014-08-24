case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*|interix|screen*)
    if [ -n "$ZSH_VERSION" ]; then
      function precmd() {
        echo -ne "\033]0;$(hostname) | $(basename $PWD)\007"
      }

      function preexec() {
        # Strip argument list from command
        PROGRAM=$(echo $1 |cut -f1 -d' ')

        echo -ne "\033]0;$(hostname) | $PROGRAM\007"
      }
    fi

    if [ -n "$BASH" ]; then
      PROMPT_COMMAND='echo -ne "\033]0;$(hostname)\007"'
    fi
  ;;
esac
