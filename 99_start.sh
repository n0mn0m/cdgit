#!/bin/sh

# Number of fcgi workers
if [ -z "$FCGI_CHILDREN" ]; then
    FCGI_CHILDREN=$(nproc)
fi

/usr/bin/spawn-fcgi -F $FCGI_CHILDREN -M 666 -s /var/run/fcgiwrap.socket /usr/sbin/fcgiwrap

/usr/sbin/nginx -g "daemon off;"
