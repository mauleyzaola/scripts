#!/bin/bash

echo "
Takasago Kaizen Installer for Ubuntu 14.04.3
2016-02-27 - Mauricio Leyzaola (mauricio.leyzaola@gmail.com)
"

GH_ACCOUNT="mauleyzaola"
GH_REPO="kaizen"
GH_USER="$USER"  #change this value if your github username is different


#setup language
sudo locale-gen UTF-8
echo export LC_ALL=en_US.UTF-8 >> ~/.bashrc
export LC_ALL=en_US.UTF-8

#todo set timezone
sudo timedatectl set-timezone UTC

echo "Updating apt-get"
sudo apt-get update --fix-missing

#install jq for json parsing
sudo apt-get install jq

#check if there is a ssh key generated, if not create it now
if [ ! -f ~/.ssh/id_rsa.pub ]; then
	echo "there is no key generated, will create one now"
	ssh-keygen
fi

#ask the user if a new key is to be created
echo "You will need full access to repository settings in order to create a key."
echo "If you already have guest access please answer no to next question."
read -p "Do you want to create a new ssh key in repository? (y/n)" newk
if [ $newk == "y" ]; then
	#add ssh key to github repo
	curl -u "$GH_USER" --data "{\"title\":\"`date +%Y%m%d%H%M%S`\",\"key\":\"`cat ~/.ssh/id_rsa.pub`\"}" https://api.github.com/repos/$GH_ACCOUNT/$GH_REPO/keys | jq .
fi

echo "Installing Postgresql Database, Git, Nginx, MongoDb, Redis"
sudo apt-get install software-properties-common python-software-properties python g++ make cmake postgresql postgresql-contrib git nginx mongodb redis-server -y
git config --global url."git@github.com:".insteadOf "https://github.com/"

#create role in postgresql for current user and setup password to match repo connections
echo "Adding role in postgres for current user and setting up postgres password to match repo connections"
sudo -u postgres psql -c "alter user postgres with password 'nevermind';"
sudo -u postgres psql -c "create role $USER;"
sudo -u postgres psql -c "alter role $USER login superuser createdb;"
sudo -u postgres psql -c "create database k;"
createdb

echo "Installing Node.js"
wget https://github.com/taaem/nodejs-linux-installer/releases/download/v0.3/node-install.sh
chmod +x node-install.sh && ./node-install.sh
rm node-install.sh
mkdir ~/npm
npm config set prefix ~/npm
echo 'export PATH=$PATH:$HOME/npm/bin' >> ~/.bashrc
echo 'export NODE_PATH=$NODE_PATH:~/npm/lib/node_modules' >>  ~/.bashrc
export PATH="$PATH:$HOME/npm/bin"
export NODE_PATH="$NODE_PATH:~/npm/lib/node_modules"


echo "Installing bower and Grunt"
npm install --g bower grunt-cli

echo "Installing Phantom.js"
sudo apt-get install libfontconfig -y
cd /usr/local/share
sudo wget https://phantomjs.googlecode.com/files/phantomjs-1.9.2-linux-x86_64.tar.bz2
sudo tar xjf phantomjs-1.9.2-linux-x86_64.tar.bz2
sudo rm phantomjs-1.9.2-linux-x86_64.tar.bz2
sudo ln -s /usr/local/share/phantomjs-1.9.2-linux-x86_64/bin/phantomjs /usr/local/share/phantomjs
sudo ln -s /usr/local/share/phantomjs-1.9.2-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs
sudo ln -s /usr/local/share/phantomjs-1.9.2-linux-x86_64/bin/phantomjs /usr/bin/phantomjs

echo "Golang install"
cd /usr/local
sudo wget https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz
sudo tar -xzf go1.4.2.linux-amd64.tar.gz
sudo rm go1.4.2.linux-amd64.tar.gz
cd ~/

#locally export all the paths to allow go get to work
echo '#go configuration' >> ~/.bashrc
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export GOBIN=$GOPATH/bin' >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc

export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOPATH/bin"

echo "Download Kaizen Project"
go get -v github.com/mauleyzaola/kaizen

echo "Download go dependencies and running unit tests"
cd $GOPATH/src/github.com/$GH_ACCOUNT/$GH_REPO/

if ! ./check.sh upgrade; then
    exit 1
fi

#create goose alias in /usr/bin/goose
if [ ! -f /usr/bin/goose ]; then
	echo "copying alias for goose into /usr/bin/goose"
	sudo ln -s $GOPATH/bin/goose /usr/bin/goose
fi

#create nginx default file to point to /static/app
echo "configuring nginx server"
KAIZEN=$GOPATH/src/github.com/mauleyzaola/kaizen

(eval "cat <<EOF
$(<$KAIZEN/docs/nginx.linux.txt)
EOF
" 2> /dev/null) > /tmp/default.nginx

sed 's/@/$/g' /tmp/default.nginx > /tmp/default
sudo mv /tmp/default /etc/nginx/sites-available/
sudo service nginx restart

#install static dependencies
cd $KAIZEN/static/
bower cache clean
bower update
cd ~/

#create kaizen service
echo "configuring kaizen service"
cd $KAIZEN/server/
cp config.json.sample config.json
go build

(eval "cat <<EOF
$(<$KAIZEN/docs/kaizen.conf)
EOF
" 2> /dev/null) > /tmp/kaizen.conf.parsed

sed 's/@/$/g' /tmp/kaizen.conf.parsed > /tmp/kaizen.conf
sudo mv /tmp/kaizen.conf /etc/init/
sudo start kaizen
