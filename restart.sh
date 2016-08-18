# restart mongodb
sudo service mongod restart

# restart nginx
sudo service nginx stop

# copy nginx config 
sudo rm /etc/nginx/sites-available/chitchat.zone
sudo cp ./sites-available/chitchat.zone /etc/nginx/sites-available/

# start nginx
sudo service nginx restart

# kill all chitchat processes
kill $(ps aux | grep 'chitchat' | awk '{print $2}')

# restart chat server
cd chitchat_chat
git pull origin master
rm -rf ./node_modules
npm install
touch log/chat/log
node chitchat_chat/lib/server.js >> log/chat/log &

cd ..
# restart back server
cd chitchat_back
git pull origin master
rm -rf ./node_modules
npm install
touch log/back/log
gulp transpile
node chitchat_back/build/lib/server.js >> log/back/log &

cd ..

# restart front server
cd chitchat_front
git pull origin master
rm -rf ./node_modules
npm install
touch log/front/log
node chitchat_front/app.js >> log/front/log &

cd ..
