#!/bin/bash

snap install bw
apt-get install logrotate -y

export $(grep -v '^#' .env | xargs)

bw login --apikey

backup_dir=$(date +'%m%d%Y')
echo $BW_PASSWORD | bw export --format encrypted_json --password $BW_PASSWORD > ./backups/${backup_dir}

unset BW_CLIENTID BW_CLIENTSECRET BW_PASSWORD

bw logout

git add .
git commit -m "Most Recent backup: $(date)"
git push origin master

cp passwords.conf /etc/logrotate.d/
logrotate -d /etc/logrotate.d/passwords.conf
