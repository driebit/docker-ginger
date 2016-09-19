#!/bin/sh

# This requires Docker to be run with --privileged
gosu root echo 524288 > /proc/sys/fs/inotify/max_user_watches || true

# Making is only necessary when mounting a custom /opt/zotonic volume
if [ "$MAKE" = true ]; then
    make
fi

# If the command given is a zotonic command, pass it to zotonic; otherwise exec it directly.
if [ -x "/opt/zotonic/src/scripts/zotonic-$1" ]; then
    exec /opt/zotonic/bin/zotonic "$@"
else
    exec "$@"
fi
