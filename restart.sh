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
kill $(ps aux | grep 'node' | awk '{print $2}')

# restart chat server
cd chitchat_chat
git pull origin master
node lib/server.js >> ../log/chat/log &

cd ..
# restart back server
cd chitchat_back
git pull origin master
gulp transpile
node build/lib/server.js >> ../log/back/log &

cd ..

# restart front server
cd chitchat_front
git pull origin master
node app.js >> ../log/front/log &

cd ..
