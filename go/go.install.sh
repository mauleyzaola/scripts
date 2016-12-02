#!/bin/bash
cd ~
wget https://storage.googleapis.com/golang/go1.7.4.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.7.4.linux-amd64.tar.gz
rm go1.7.4.linux-amd64.tar.gz

echo '#go configuration' >> ~/.bashrc
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export GOBIN=$GOPATH/bin' >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc

export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOPATH/bin"
