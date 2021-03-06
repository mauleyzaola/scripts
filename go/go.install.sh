#!/bin/bash
export GOFILE="go1.15.8.linux-amd64.tar.gz"
cd ~
wget "https://golang.org/dl/$GOFILE"
sudo tar -C /usr/local -xzf "$GOFILE"
rm "$GOFILE"

echo '#go configuration' >> ~/.bashrc
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export GOBIN=$GOPATH/bin' >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc

export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOPATH/bin"
