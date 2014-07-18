# Create useful aliases for apt cleanup commands
if which apt-get &> /dev/null; then
  # Remove old kernels (but the most recent, and the currently running one
  alias apt-purge-old-kernels="apt-get purge $(dpkg --list |egrep 'linux-image-[0-9]' |awk '{print $3,$2}' |sort -nr |tail -n +2 |grep -v $(uname -r) |awk '{print $2}' |tr '[:space:]' ' ')"

  # Purge removed packages
  alias apt-purge-removed-packages="apt-get purge -y $(dpkg -l |grep '^rc' |awk '{print $2}' |tr '[:space:]' ' ')"
fi
