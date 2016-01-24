## Vagrant Starter

Welcome to this quick start guide to setting up a development environment using Vagrant.

You are a developer and you just got a new computer.  You want to get it setup so you can start working on the next big thing but you also want to keep your machine clean and tidy.  Plus, you use different development stacks for different projects.  Using a virtual development environment that is disposable is a great option.

There are many options avaible and this project is focused on really great one:  **Vagrant**.

Vagrant is simple and easy to use.  But like anything it has to be setup and configured.  I've put together a started setup that will allow you to get started quickly.  You can easily fire up virtual servers for some common technology stacks:  Ruby on Rails, Node.js, Postgres, MongoDB, etc.  This self-contained guide will walk you through the process.  Once you see how this works, you can modify it to use your own preferred technology stack.

I won't try to make the case for Vagrant here.
Checkout [Why Vagrant?](http://docs.vagrantup.com/v2/why-vagrant/index.html) for that.

I created this on my MacBook Pro laptop running OS X Mountain Lion.

### Acknowledgments

Many thanks to Mitchell Hashimoto and Ryan Bates for creating such helpful resources.

* [Vagrant: Up And Running](http://www.amazon.com/Vagrant-Up-Running-Mitchell-Hashimoto/dp/1449335837/) by Mitchell Hashimoto
* [RailsCast #292 Virtual Machines with Vagrant](http://railscasts.com/episodes/292-virtual-machines-with-vagrant) by Ryan Bates
* [RailsCast #293 Nginx & Unicorn](http://railscasts.com/episodes/293-nginx-unicorn) by Ryan Bates

I don't proclaim to be an expert on Vagrant.  I simply created this guide while going through the materials listed above.

### Getting Started

The setup is simple.
You only need to install two software packages on your computer.
Should you decide you don't want to use Vagrant any more, you can simply uninstall both of them and your computer will be clean again.  (But Vagrant is so awesome you won't want to uninstall it.)

* [Download and install Virtual Box](https://www.virtualbox.org/wiki/Downloads).
Vagrant primarily uses Oracle's VirtualBox to provide the virtual servers.
Other providers such as VMWare and AWS are in the works.
To make this guide, I used version 4.2.18.
It is recommended that you restart your computer after installing Virtual Box.

* [Download and install Vagrant](http://www.vagrantup.com/downloads.html).
To make this guide, I used version 1.3.4.

* That's it.
Of course, I am making a few assumptions about your computer.
I assume that your computer already has your favorite browser,
your favorite text editor, and your favorite source control (i.e. Git).

As you'll see, you don't need to install any other software on your computer.
We'll use Vagrant to install the software on the virtual servers.
Then Vagrant's secret sauce will allow you to edit the source code with the text editor on your computer and access your
application with the browser on your computer.

### Creating Virtual Servers

Okay, with VirtualBox and Vagrant installed, let's make some virtual servers.
Like any good cooking show, I've some prebaked things in the oven.
Besides this README guide, this repository has Vagrant configuration files and scripts.
This will allow you to get up and running quickly and provide an example from which to learn.
Download this repository from GitHub.

```unix
mkdir -p ~/GitHub/rkiel
cd ~/GitHub/rkiel
git clone https://github.com/rkiel/vagrant-starter.git
```

There are two parts to this small repo.

1. A file `Vagrantfile` which is the primary configuration file used by Vagrant.
(Just like `Capfile` is the primary configuration file used by Capistrano.)
2. A directory `provision`.  It contains all the provisioning scripts and configurations that Vagrant will use to create our technology stack.  (There is nothing special about the name of this directory.)

Vagrant can provision servers using serveral different methods.
To keep things simple, we are going to use unix shell scripts.
Vagrant also supports [Chef](http://www.opscode.com/chef/) and
[Puppet](http://puppetlabs.com) but these are beyond the scope of this guide.

### List of available servers

Server | Type   | IP            | Stack Provisioners
------ | ------ | ------------- | ------------------
ruby   | ruby   | 192.168.33.10 | rvm
rails  | ruby   | 192.168.33.10 | rvm, postgresql_client
deploy | ruby   | 192.168.33.10 | rvm, mina, ssh
pg     | sql    | 192.168.33.20 | postgresql_server
mongo  | nosql  | 192.168.33.30 | mongodb_server
aws    | aws    | 192.168.33.40 | rvm, aws
heroku | heroku | 192.168.33.50 | git, rvm, heroku, ssh
node   | javascript | 192.168.33.60 | node, mongodb_client
react  | javascript | 192.168.33.60 | node, react
express| javascript | 192.168.33.60 | node, express, mongodb_client
sails  | javascript | 192.168.33.60 | node, sails, mongodb_client
mean   | javascript | 192.168.33.60 | git, node, mean, mongodb_client
nginx  | static | 192.168.33.70 | nginx-static

### Sample Ruby on Rails Setup

Edit the `Vagrantfile` and setup 3 virtual servers.  One for running Ruby on Rais, one for running a Postgres database, and one for the Heroku toolbelt.  All you have to do is change one line.

````ruby
active = [:rails, :pg, :heroku]
````

Now start up Vagrant.  (This take a few minutes the first time.)

````unix
vagrant up
````

Now ssh into the virtual server called `rails` to install gems, run rake tasks, run the rails server, and run the rails console.

````unix
vagrant ssh rails
````

If you want, you can ssh into the virtual server called `pg`.  It is just databse server so you probably won't every need to.

````unix
vagrant ssh pg
````

Now ssh into the virtual server called `heruko` to use the heroku toolbelt to deploy your application to Heroku.

````unix
vagrant ssh heroku
````

### Sample Express.js Setup

Edit the `Vagrantfile` and setup 3 virtual servers.  One for running Node.js, one for running a MongoDB database, and one for the Heroku toolbelt.  All you have to do is change one line.

````ruby
active = [:express, :mongo, :heroku]
````

Now start up Vagrant.  (This take a few minutes the first time.)

````unix
vagrant up
````

Now ssh into the virtual server called `express` to install npm modules, run gulp/grunt tasks, and run the node server.

````unix
vagrant ssh express
````

If you want, you can ssh into the virtual server called `mongo`.  It is just databse server so you probably won't every need to.

````unix
vagrant ssh mongo
````

Now ssh into the virtual server called `heruko` to use the heroku toolbelt to deploy your application to Heroku.

````unix
vagrant ssh heroku
````

### Mini Vagrant Tutorial

If you want to learn how to build all this from scratch you can.  There is mini-tutorial on the project [Wiki](https://github.com/rkiel/vagrant-starter/wiki).


