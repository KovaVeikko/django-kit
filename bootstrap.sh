#!/usr/bin/env bash

# download the package lists from the repositories
apt-get update


# --- python ---

# set default python version to 3.4
ln -sf /usr/bin/python3.4 /usr/bin/python

# install pip
apt-get install -y python3-pip

# install mysql
echo mysql-server mysql-server/root_password select "vagrant" | debconf-set-selections
echo mysql-server mysql-server/root_password_again select "vagrant" | debconf-set-selections
apt-get install -y mysql-server-5.5 libmysqlclient-dev

# install python modules
pip3 install -r /vagrant/requirements.txt

# create database
mysql -uroot -pvagrant -e "CREATE DATABASE djangokit;"
mysql -uroot -pvagrant -e "CREATE USER 'djangokit'@'localhost' IDENTIFIED BY 'djangokit';"
mysql -uroot -pvagrant -e "GRANT ALL PRIVILEGES on *.* TO 'djangokit'@'localhost';"

# tasks
cd /vagrant && python manage.py makemigrations --noinput
cd /vagrant && python manage.py migrate

# Run server and static file watcher in screen
su - vagrant -c "cd /vagrant && screen -S server -d -m python manage.py runserver 0.0.0.0:8000"
su - vagrant -c "cd /vagrant && screen -S watcher -d -m python manage.py watchstatic"
