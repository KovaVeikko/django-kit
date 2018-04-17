# Django kit
Django kit is a template for launching Python/Django server 
applications with REST API. It includes:

- Django 2.0
- Python 3.4
- Django REST framework
- MySQL
- Vagrant

## Get started
``` 
git clone git@github.com:kovaveikko/django-kit YourApp
cd YourApp
vagrant up
```

The development environment is a <a href=https://www.vagrantup.com/>Vagrant</a>-powered
virtual ubuntu server. The first time the VM is launched, Vagrant installs
all the required packages and starts the application. This may take a while.

When Vagrant has finished installing, the app is running on:
``` 
127.0.0.1:9000
```  
 

## Commands
Start the virtual machine <br>
`vagrant up`

Stop the virtual machine <br>
`vagrant suspend`

Connect to the virtual machine via ssh <br>
`vagrant ssh`
