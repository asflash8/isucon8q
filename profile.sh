#!/bin/bash
set -ex

echo "start profiling"

sudo /usr/local/bin/alp -f /var/log/nginx/access.log --sum -r > /tmp/profiles/alp.log.$(date "+%Y%m%d_%H%M%S")
sudo pt-query-digest /var/log/mariadb/mysqld-slow.log > /tmp/profiles/mysql-slow.log.$(date "+%Y%m%d_%H%M%S")

echo "end profiling"
