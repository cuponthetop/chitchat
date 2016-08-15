mkdir log
mkdir log/mongo

#start mongodb
sudo service mongod start --logpath ./log/mongo

# start nginx
sudo service nginx start -c ./nginx/nginx.conf

# clone server repositories
git clone https://github.com/cuponthetop/chitchat_front.git
git clone https://github.com/cuponthetop/chitchat_back.git
git clone https://github.com/cuponthetop/chitchat_chat.git

# start chat server
cd chitchat_chat
npm install

cd ..
# start back server
cd chitchat_back
npm install
gulp transpile

cd ..

# start front server
cd chitchat_front
npm install

cd ..
