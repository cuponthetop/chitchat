
cd /opt/letsencrypt
./letsencrypt-auto certonly -a webroot --webroot-path=/home/ubuntu/chitchat/chitchat_front/public -d chitchat.zone -d www.chitchat.zone
