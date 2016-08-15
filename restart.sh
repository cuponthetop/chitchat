# restart mongodb
sudo service mongod restart

# restart nginx
sudo service nginx restart -c ./nginx/nginx.conf

# restart chat server
cd chitchat_chat
git pull origin master
rm -rf ./node_modules
npm install

cd ..
# restart back server
cd chitchat_back
git pull origin master
rm -rf ./node_modules
npm install
gulp transpile

cd ..

# restart front server
cd chitchat_front
git pull origin master
rm -rf ./node_modules
npm install

cd ..
