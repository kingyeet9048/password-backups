
# How to set up
1. clone this repo into /etc/
```bash
cd /etc/
git clone git@github.com:kingyeet9048/password-backups.git
```
2. Go to bitwarden vault and get the security keys. Copy the env template into root directory of github repo as ".env" and apply the secrets from your bitwarden vault (client_id and client_secret). See example
 a. https://vault.bitwarden.com/#/settings/security/security-keys
 b. Dont forget to save your password bitwarden as the env variable "BW_PASSWORD" in the .env file.
 c. Make sure the .env file is not readable and writable by everyone. Locking this file down is important.  
```bash
sudo cp template/env.template ./.env
sudo nano .env
```
p.s after you finish with editing with nano save with ctl + x + y + "enter"
3. run the setup script. This will install everything you need along with a crontab to run the backup script every day. It will also push out the passwords. Passwords are encrypted with your password. 

