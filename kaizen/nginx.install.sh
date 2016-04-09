#!/bin/bash

cd $GOPATH/src/github.com/mauleyzaola/kaizen

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
