#!/bin/bash

sudo apt-get install git

echo "Configuring git to use ssh instead of http"

git config --global url."git@github.com:".insteadOf "https://github.com/"