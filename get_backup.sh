#!/bin/bash

#apt-get install logrotate -y

export $(grep -v '^#' .env | xargs)

/usr/local/bin/bw login --apikey

backup_dir=$(date +'%m%d%Y')
echo $BW_PASSWORD | /usr/local/bin/bw export --output backups/output --format encrypted_json --password $BW_PASSWORD

chmod o-rw ./backups/output

unset BW_CLIENTID BW_CLIENTSECRET BW_PASSWORD

/usr/local/bin/bw logout

git add .
git commit -m "Most Recent backup: $(date)"
git push origin master

#cp passwords.conf /etc/logrotate.d/
#logrotate -d /etc/logrotate.d/passwords.conf
