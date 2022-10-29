#!/bin/bash

apt-get update -y && apt-get upgrade -y

apt-get install npm -y

npm install -g @bitwarden/cli

chmod +x get_backups.sh

(crontab -l ; echo '0 20 * * * bash -c "cd /etc/password-backups && ./get_backup.sh" > /etc/password-backups/logs/backup.log 2>&1')| crontab -
