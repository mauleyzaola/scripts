#!/bin/bash
#requirements
sudo apt-get install libfontconfig -y

#go to directory /usb/local/share
cd /usr/local/share


#download latest phantomjs and uncompress
sudo wget https://phantomjs.googlecode.com/files/phantomjs-1.9.2-linux-x86_64.tar.bz2
sudo tar xjf phantomjs-1.9.2-linux-x86_64.tar.bz2

#delete downloaded file
sudo rm phantomjs-1.9.2-linux-x86_64.tar.bz2

#create links
sudo ln -s /usr/local/share/phantomjs-1.9.2-linux-x86_64/bin/phantomjs /usr/local/share/phantomjs
sudo ln -s /usr/local/share/phantomjs-1.9.2-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs
sudo ln -s /usr/local/share/phantomjs-1.9.2-linux-x86_64/bin/phantomjs /usr/bin/phantomjs
