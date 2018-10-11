#!/bin/bash
set -ex

echo "start deploying"

cd /tmp/isucon8
git pull origin master
sudo cp /tmp/isucon8/ruby/lib/torb/web.rb /home/isucon/torb/webapp/ruby/lib/torb/web.rb

sudo systemctl restart mariadb
sudo systemctl restart torb.ruby
sudo systemctl restart nginx

: > /var/log/nginx/access.log
: > /var/log/mariadb/mysqld-slow.log

echo "end deploying"
