#!/bin/bash
sudo apt-get install git -y
echo "Configuring git to use ssh instead of http"
git config --global url."git@github.com:".insteadOf "https://github.com/"
git config --global url."git@bitbucket.org:".insteadOf "https://bitbucket.org/"
