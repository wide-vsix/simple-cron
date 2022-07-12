#!/bin/sh

set -e

# Creates the cron script
cat << EOF > /run-script.sh
echo ------------
echo `date` job starting.
set -e
${CRON_COMMAND}
echo `date` job finished.
echo ------------
EOF
chmod +x /run-script.sh
cat /run-script.sh

# Setup the crontab entry
export CRONTAB_ENTRY="${CRON_OPTION} /run-script.sh > /proc/1/fd/1 2>/proc/1/fd/2"