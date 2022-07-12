#!/bin/sh

if test -f /entrypoint.d/*; then
    . /entrypoint.d/*
fi

cat << EOF > /etc/cron.d/script
${CRONTAB_ENTRY}
EOF
crontab /etc/cron.d/script

cat /etc/cron.d/script

exec "$@"