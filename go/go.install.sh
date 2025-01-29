#!/bin/bash
cd ~
export GOFILE="go1.23.5.linux-amd64.tar.gz"
wget "https://go.dev/dl/$GOFILE"
sudo tar -C /usr/local -xzf "$GOFILE"
rm "$GOFILE"

echo ' \n\n#go configuration' >> ~/.bashrc
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export GOBIN=$GOPATH/bin' >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc

export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOPATH/bin"
