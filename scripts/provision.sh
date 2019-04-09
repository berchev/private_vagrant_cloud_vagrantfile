#!/usr/bin/env bash
set -x

# Install nginx
[ -d "/var/www" ] || {
  apt update	
  apt install nginx -y
}

# Create main directory structure of the webserver
[ -d "/var/www/vagrant" ] || {
  mkdir -p /var/www/vagrant/xenial64/boxes
  cp /vagrant/conf/xenial64.json /var/www/vagrant/xenial64/
  cp /vagrant/assets/*.box /var/www/vagrant/xenial64/boxes/
}

# Setup webserver
[ -f "/etc/nginx/sites-enabled/default" ] && rm -rf /etc/nginx/sites-enabled/default

[ -f "/etc/nginx/sites-available/localhost" ] || {
  cp /vagrant/conf/nginx.conf /etc/nginx/sites-available/localhost
  ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/000-localhost
}

# Restart nginx
systemctl restart nginx.service
