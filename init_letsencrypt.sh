
cd /opt/letsencrypt
./letsencrypt-auto certonly -a webroot --webroot-path=/home/ubuntu/chitchat/chitchat_front/.well-known -d chitchat.zone -d www.chitchat.zone
