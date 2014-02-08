## Vagrant Starter - Rails Edition

Welcome to this quick start guide to setting up a Ruby on Rails development environment using Vagrant.

Imagine you just got a new computer and want to quickly setup a Virtual Box based development environment for Ruby on Rails.
Vagrant is a great tool to make that happen.
This self-contained guide will walk you through the process.
The result will be two virtual, Ubuntu servers.  One server hosting a PostgreSQL database and the other hosting a simple Rails application.
The complete technology stack I've stitched together for this guide includes:

* RVM
* Ruby 2.0
* Rails 4.0
* Nginx
* Unicorn
* PostgreSQL.

Once you see how this works, you can modify it to use your own preferred technology stack.

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
You only need to install two software packages.
Once you've completed the guide, you can uninstall them both and your computer will be clean again.

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

* But what about Ruby and Bundler and Rails?

As you'll see, you don't need to install any of these on your computer.
We'll use Vagrant to install them on the virtual servers.
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
2. A directory `provision`.
It groups together in one place all the provisioning scripts and configurations that Vagrant will use to create our technology stack.
(There is nothing special about the name of this directory.)

Vagrant can provision servers using serveral different methods.
To keep things simple, we are going to use unix shell scripts.
Vagrant also supports [Chef](http://www.opscode.com/chef/) and
[Puppet](http://puppetlabs.com) but these are beyond the scope of this guide.

Now use Vagrant to boot up the virtual servers.

```unix
cd ~/GitHub/rkiel/vagrant-starter
vagrant up
```

The first time you run this command, it will take some time to download all the software.
(Good time to check Facebook and Twitter.)
Once complete, you should now have 2 Ubuntu 12.04 LTS (GNU/Linux 3.2.0-23-generic x86_64) servers up and running.
Let's take a closer look.

The first virtual server is refered to as "web".
If you look inside `Vagrantfile`, you'll see a configuration block for "web".
Inside the block, I hardcoded an IP address of 192.168.33.10 and three unix scripts.
Once the "web" server boots up, Vagrant will run three unix scripts.
* The RVM script will install RVM and Ruby 2.0.
* The Nginx script will install Nginx and configure it to use Unicorn.
* Vagrant will not install Unicorn.
Since it's a Ruby gem, it will be installed later when we get Rails up and running.
* The PostgreSQL script will install the client software that will allow us to install the PostgreSQL gem later.

Each virtual server created by Vagrant creates a `vagrant` user with a password of `vagrant`.
But Vagrant also sets up ssh so you don't need to enter a password to login.

Use Vagrant to connect to the "web" server.

```unix
vagrant ssh web
```

Take a look around and then exit.

```unix
pwd
whoami
rvm list
ruby -v
ps -ef |grep nginx
exit
```

The second virtual server is refered to as "db".
If you look inside `Vagrantfile`, you'll see a configuration block for "db".
Inside the block, I hardcoded an IP address of 192.168.33.11 and a unix script.
Once the "db" server boots up, Vagrant will run the script.
* The PostgreSQL script will install the PostgreSQL server.
It also is hardcoded to create a user `robert` with a password of `robert`.
This is the user our Rails application will use to create and access the database.

Use Vagrant to connect to the "db" server.

```unix
vagrant ssh db
```

Take a look around and then exit.

```unix
whoami
ps -ef |grep postgres
exit
```

So the two servers are up and running.
You can play around with them, change them, experiment with them without any risk.
Why?  Because you can quickly and easily destroy them and start over.
Let's try it.

```unix
vagrant destroy
```

From now on, re-creating the servers should be faster since the Ubuntu box image is cached.
Vagrant stores that information in your home directory under `~/.vagrant.d`.

```unix
vagrant up
```

Now we are ready to setup Rails. But first, destroy the existing server.

```unix
vagrant destroy
```

### Ruby on Rails

I created an another Git repository with the output from `rails new rails-starter`.
This way you can create a brand new Rails 4 project on your computer without having Ruby or Bundler or Rails installed.
Download the rails-starter repo from GitHub.

```unix
mkdir -p ~/GitHub/rkiel
cd ~/GitHub/rkiel
git clone https://github.com/rkiel/rails-starter.git MY_NEW_APP
```

Go to the Rails Starter repo.  Replace any references to RailsStarter in the code with MyNewApp.

```unix
cd ~/GitHub/rkiel/MY_NEW_APP
./bin/starter.sh MyNewApp
rm bin/starter.sh
```

Copy over the Vagrant configuration files from the vagrant-starter repo.

```unix
cp ../vagrant-starter/Vagrantfile .
cp -r ../vagrant-starter/provision .
```

I created a `database.yml` file to access the PostgreSQL database.
It uses the hardcoded IP address, username, and password mentioned above.
We also don't want to include it in our Git repo so add an entry in `.gitignore`.

```unix
cp provision/database.yml config
echo "config/database.yml" >> .gitignore
```

To support JavaScript and the Asset pipeline, PostgreSQL, and Unicorn, add the following gems to the `Gemfile`.

```unix
echo "gem 'therubyracer', platforms: :ruby" >> Gemfile
echo "gem 'pg'" >> Gemfile
echo "gem 'unicorn'" >> Gemfile
```

We're using PostgreSQL for development so no need for SQLite. Remove its gem from the `Gemfile`.

```unix
sed -i .bak -e "s/gem 'sqlite3'/#gem 'sqlite3'/" Gemfile
rm Gemfile.bak
```

When Vagrant boots up its servers, it saves temporary data in a `.vagrant` directory.
We don't want to include any of that in our Git repo so add an entry in `.gitignore`.

```unix
echo ".vagrant" >> .gitignore
```

If you want to use this Git repo as your own, you can disconnect it from my rails-starter repo.

```unix
rm -rf .git
git init
git add .
git commit -m "initial commit"
```

Start the servers and login to "web".

```unix
vagrant up
vagrant ssh web
```

Now for the first part of Vagrant's secret sauce.
Vagrant configures each virtual server with a mount point `/vagrant`.
This provides the bridge between the virtual server and your computer. Take a look.

```unix
cd /vagrant
ls -l
```

With access to the Rails project files, we can finish our configuration.
Install the gems using bundler.

```unix
bundle install
```

(NOTE: Occasionally I get an SSL error message in the middle of installing all the gems.
Just run `bundle install` again and it will pick up where it got interrupted.)

Since we started with a new, empty Rails project, it won't really do anything.
We should create something trivial to play with.
Let's create a scaffold for a simple todo list item.

```unix
rails generate scaffold Item text
```

Now we can create our database and run the migrations.

```unix
rake db:create
rake db:migrate
```

Start the Rails server.

```unix
rails server
```

Now for the other part of Vagrant's secret sauce.
The IP addresses used by the virtual servers are accessable by your computer.
Open your browser to IP 192.168.33.10 on port 3000.

http://192.168.33.10:3000/items

Success!  You have a brand new Rails application up and running on a virtual server using a database running on another virtual server.

At this point, you can develop your application on your own computer using your favorite edit and browser.
Because of the shared file system, Rails running on the virtual server will automatically pickup your changes.
Life is good.

But when you eventually deploy this application to production, you might not want to use just WEBrick.
As part of this guide, Nginx is configured and running on the "web" server.
We added the Unicorn gem to our application, so let's use it.

Use CNTL-C to stop the `rails server`.
Start up the Unicorn server.

```unix
unicorn -c provision/unicorn.rb
```

Nginx is configured to listen on port 80.
It is a reverse proxy for Unicorn.
Nginx and Unicorn are configured to communicate via a unix socket `/tmp/unicorn.rails_starter.sock`.
Open your browser to IP 192.168.33.10 on port 80.

http://192.168.33.10/items

Success!  Your Rails application is up and running with Nginx and Unicorn.

### Next Step

### Cleanup

