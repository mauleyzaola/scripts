#/bin/bash
cd ~
wget https://github.com/taaem/nodejs-linux-installer/releases/download/v0.3/node-install.sh
chmod +x node-install.sh && ./node-install.sh

#point npm installations to local path so there is no need for sudo
mkdir -p ~/npm
npm config set prefix ~/npm
echo export PATH="$PATH:$HOME/npm/bin" >> ~/.bashrc
echo export NODE_PATH="$NODE_PATH:~/npm/lib/node_modules" >>  ~/.bashrc
source ~/.bashrc

# front-end dependencies recommended to install
npm install --g bower grunt-cli

rm node-install.sh
