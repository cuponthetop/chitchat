mkdir log
mkdir log/front log/back log/chat
touch log/front/log log/back/log log/chat/log

#start mongodb
sudo service mongod restart

# copy nginx config 
sudo cp ./sites-available/chitchat.zone /etc/nginx/sites-available/
sudo rm /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
sudo ln -s /etc/nginx/sites-available/chitchat.zone /etc/nginx/sites-enabled/

# start nginx
sudo service nginx restart

# clone server repositories
git clone https://github.com/cuponthetop/chitchat_front.git
git clone https://github.com/cuponthetop/chitchat_back.git
git clone https://github.com/cuponthetop/chitchat_chat.git

# start chat server
cd chitchat_chat
npm install
node lib/server.js >> ../log/chat/log &
cd ..
# start back server
cd chitchat_back
npm install
gulp transpile
node build/lib/server.js >> ../log/back/log &
cd ..

# start front server
cd chitchat_front
npm install
node app.js >> ../log/front/log &
cd ..
