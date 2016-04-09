#!/bin/bash

echo "creating k database"
psql -c 'create database k;'

cd $GOPATH/src/github.com/mauleyzaola/kaizen

KAIZEN=$GOPATH/src/github.com/mauleyzaola/kaizen

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