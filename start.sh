mkdir log
mkdir log/front log/back log/chat

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
touch log/chat/log
node chitchat_chat/lib/server.js >> log/chat/log &
cd ..
# start back server
cd chitchat_back
npm install
touch log/back/log
gulp transpile
node chitchat_back/build/lib/server.js >> log/back/log &
cd ..

# start front server
cd chitchat_front
npm install
touch log/front/log
node chitchat_front/app.js >> log/front/log &
cd ..
