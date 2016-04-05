#!/bin/bash

echo "Installing Postgresql database"
sudo apt-get install software-properties-common python-software-properties python g++ make cmake postgresql postgresql-contrib -y

echo "Adding role in postgres for current user and setting up postgres password to match repo connections"
sudo -u postgres psql -c "alter user postgres with password 'nevermind';"
sudo -u postgres psql -c "create role $USER;"
sudo -u postgres psql -c "alter role $USER login superuser createdb;"
createdb